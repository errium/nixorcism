{
  flake.modules.nixos.theming_wallust = {
    confDir,
    config,
    pkgs,
    ...
  }: let
    # Some variables live here because nixd complains otherwise,
    # which I'm not a fan of
    bold = "\033[1m";
    green = "\033[1;32m";
    magenta = "\033[1;35m";
    reset = "\033[0m";

    rebuildCmd =
      if config.hm.programs.nh.enable
      then "nh os switch"
      else "nixos-rebuld switch --flake ${confDir}";

    retheme = pkgs.writeShellScriptBin "retheme" ''
      set -e

      # Helper functions
      info() { echo -e "${magenta}ℹ${reset} ${bold}$*${reset}"; }
      success() { echo -e "${green}*${reset} ${bold}$*${reset}"; }
      usage() {
      	info "Usage: retheme <path-to-wallpaper> [--rebuild|-r]"
      	exit 1
      }

      # Variables
      WALLPAPER="$1"
      REBUILD=false
      DEST="${confDir}/.images/wallpaper.png"

      # Rebuild flag
      [[ $# -lt 1 ]] && usage
      if [[ "''${2:-}" == "--rebuild" || "''${2:-}" == "-r" ]]; then
      	REBUILD=true
      fi

      # Actions
      ${pkgs.imagemagick}/bin/magick "$WALLPAPER" "$DEST"
      success "Wallpaper converted and saved"

      ${pkgs.wallust}/bin/wallust run "$DEST"
      success "Palette generated"

      if $REBUILD; then
      	info "Rebuilding system…"
        ${rebuildCmd}
      else
      	info "Rebuild to apply"
      fi
    '';
  in {hm.home.packages = [retheme];};
}
