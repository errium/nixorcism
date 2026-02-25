{
  flake.modules.nixos.theming_wallust = {
    confDir,
    pkgs,
    ...
  }: let
    # Some variables live here because nixd complains otherwise,
    # which I'm not a fan of
    bold = "\\e[1m";
    green = "\\e[1;32m";
    magenta = "\\e[1;35m";
    reset = "\\e[0m";

    setwp = pkgs.writeShellScriptBin "setwp" ''
      set -e

      info() { echo -e "${magenta}ℹ${reset} ${bold}$*${reset}"; }
      success() { echo -e "${green}*${reset} ${bold}$*${reset}"; }
      usage() {
      	info "Usage: setwp <path-to-wallpaper> [--rebuild|-r]"
      	exit 1
      }

      WALLPAPER="$1"
      REBUILD=false
      DEST="${confDir}/.images/wallpaper.png"

      [[ $# -lt 1 ]] && { info "Usage: setwp <path-to-wallpaper>"; exit 1; }

      ${pkgs.imagemagick}/bin/magick "$WALLPAPER" "$DEST"
      success "Wallpaper converted and saved"
      ${pkgs.wallust}/bin/wallust run "$DEST"
      success "Palette generated"
      info "Rebuild to apply"
    '';
  in {hm.home.packages = [setwp];};
}
