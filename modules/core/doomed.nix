{
  flake.modules.nixos.core = {
    config,
    lib,
    pkgs,
    ...
  }: {
    # TEST
    environment.systemPackages = lib.mkIf config.nixorcism.preservation.enable [
      (pkgs.writeShellApplication {
        name = "doomed";

        runtimeInputs = [
          config.boot.zfs.package
          pkgs.util-linux
          pkgs.gawk
        ];

        text = ''
          [ "$EUID" -eq 0 ] || exec /run/wrappers/bin/sudo "$0" "$@"

          since=""
          all=0
          pat=""
          while [ $# -gt 0 ]; do
            case $1 in
              -s|--since) since=$2; shift 2 ;;
              -a|--all) all=1; shift ;;
              -h|--help) echo "usage: rollback-diff [-s '10 min'] [-a] [regex...]"; exit 0 ;;
              *) pat="''${pat:+$pat|}$1"; shift ;;
            esac
          done
          export pat

          cutoff=0
          [ -z "$since" ] || cutoff=$(date -d "$since ago" +%s)

          color=0
          [ -t 1 ] && color=1

          root=$(findmnt -no SOURCE /)
          persist=$(findmnt -no SOURCE --target /persistent)
          if [ "$persist" = "$root" ]; then
            echo "/persistent лежит на том же датасете, что и /, rollback снесёт и его" >&2
            exit 1
          fi

          zfs diff -FHt "$root@blank" \
            | LC_ALL=C sort -t $'\t' -k4 \
            | awk -F'\t' -v cutoff="$cutoff" -v all="$all" -v color="$color" '
                BEGIN {
                  pat = tolower(ENVIRON["pat"])
                  g = color ? "\033[32m" : ""; y = color ? "\033[33m" : ""
                  d = color ? "\033[2m" : "";  r = color ? "\033[0m" : ""
                }
                $2 !~ /^[+M]$/ || ($2 == "M" && $3 == "/") || $1 < cutoff { next }
                pat != "" && tolower($4) !~ pat { next }
                {
                  n++; kind[n] = $2; type[n] = $3; path[n] = $4
                  if ($2 == "+" && $3 == "/") newDir[$4] = 1
                }
                END {
                  for (i = 1; i <= n; i++) {
                    a = path[i]
                    while (!all && sub(/\/[^\/]*$/, "", a) && a != "")
                      if (a in newDir) top[i] = a
                    if (i in top) { under[top[i]]++; hidden++ }
                  }
                  for (i = 1; i <= n; i++) {
                    if (i in top) continue
                    p = path[i]
                    c = (kind[i] == "+") ? g : y
                    note = (p in under) ? d "  (+" under[p] ")" r : ""
                    printf "%s%s%s %s%s%s\n", c, kind[i], r, p, (type[i] == "/" ? "/" : ""), note
                  }
                  if (n) printf "%s%d записей, свёрнуто %d (-a чтобы раскрыть)%s\n", d, n, hidden, r > "/dev/stderr"
                }'
        '';
      })
    ];
  };
}
