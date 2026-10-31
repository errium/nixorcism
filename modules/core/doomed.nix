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
          pkgs.coreutils
          pkgs.fzf
          pkgs.gawk
          pkgs.util-linux
        ];

        text = ''
          usage() {
            cat <<'EOF'
          Usage: doomed [--since DURATION] [--all] [REGEX ...]

          Browse root dataset changes since @blank with fzf.

          Options:
            --since DURATION  Include changes newer than a duration (for example 2h or 3d)
            --all             Show paths inside newly added directories
            --help            Show this help

          Positional arguments are POSIX extended regular expressions matched against paths.
          In fzf, use Tab to select multiple paths and Enter to print the selection.
          EOF
          }

          die() {
            echo "doomed: $*" >&2
            exit 1
          }

          parse_args() {
            since=
            show_all=0
            patterns=()

            while (($#)); do
              case "$1" in
                --help|-h) usage; exit 0 ;;
                --all) show_all=1 ;;
                --since)
                  (($# >= 2)) && [[ -n $2 && $2 != --* ]] || {
                    echo "doomed: --since requires a duration" >&2
                    exit 2
                  }
                  since=$2
                  shift
                  ;;
                --*) echo "doomed: unknown option: $1" >&2; exit 2 ;;
                *) patterns+=("$1") ;;
              esac
              shift
            done
          }

          root_dataset() {
            local source
            source=$(findmnt -n -o SOURCE --target /) || die "cannot determine the root filesystem"
            source=''${source%%\[*\]}
            [[ -n $source && $source != /dev/* && $source != none ]] || \
              die "root filesystem is not a ZFS dataset (source: $source)"
            printf '%s\n' "$source"
          }

          check_mounts() {
            local target
            target=$(findmnt -n -o TARGET --target /persistent 2>/dev/null || true)
            [[ $target == /persistent ]] || die "/persistent is not mounted as a separate filesystem"
          }

          check_snapshot() {
            local snapshot=$1
            zfs list -H -o name "$snapshot" >/dev/null 2>&1 || die "snapshot $snapshot does not exist"
          }

          collect_changes() {
            local snapshot=$1
            local since_epoch=
            local diff_output

            if [[ -n $since ]]; then
              since_epoch=$(date -d "$since ago" +%s 2>/dev/null) || {
                echo "doomed: invalid duration: $since" >&2
                exit 2
              }
            fi

            diff_output=$(zfs diff -FHt "$snapshot" 2>&1) || \
              die "cannot read changes from $snapshot: $diff_output"

            printf '%s\n' "$diff_output" | awk -F '\t' \
              -v since_epoch="$since_epoch" \
              -v show_all="$show_all" \
              -v patterns="$(printf '%s\n' "''${patterns[@]}")" '
                function matches(path, n, parts, i) {
                  if (patterns == "") return 1
                  n = split(patterns, parts, "\n")
                  for (i = 1; i <= n; i++) if (path ~ parts[i]) return 1
                  return 0
                }

                {
                  stamp = $1
                  change = $2
                  type = $3
                  path = $4
                  if (change == "-" || path == "") next

                  if (since_epoch != "") {
                    command = "date -d \"" stamp "\" +%s"
                    command | getline epoch
                    close(command)
                    if (epoch == "" || epoch < since_epoch) next
                  }
                  if (!matches(path)) next

                  if (change == "+" && (type == "/" || type == "d")) added_dirs[path] = 1
                  count++
                  changes[count] = change
                  paths[count] = path
                }

                END {
                  for (i = 1; i <= count; i++) {
                    path = paths[i]
                    if (!show_all) {
                      hidden = 0
                      for (dir in added_dirs)
                        if (index(path, dir "/") == 1) hidden = 1
                      if (hidden) continue
                    }
                    printf "%s\t%s\n", changes[i], path
                  }
                }
              '
          }

          main() {
            parse_args "$@"

            local dataset snapshot changes
            dataset=$(root_dataset)
            check_mounts
            snapshot="$dataset@blank"
            check_snapshot "$snapshot"
            changes=$(collect_changes "$snapshot")

            if [[ -z $changes ]]; then
              echo "No added or changed paths found."
              return 0
            fi

            printf '%s\n' "$changes" |
              sort -k2,2 |
              fzf \
                --ansi \
                --multi \
                --no-hscroll \
                --delimiter=$'\t' \
                --with-nth=2.. \
                --header='Changes since @blank · Tab to select · Enter to print' \
                --bind='ctrl-a:select-all,ctrl-d:deselect-all' |
              awk -F '\t' '{ print $2 }'
          }

          main "$@"
        '';
      })
    ];
  };
}
