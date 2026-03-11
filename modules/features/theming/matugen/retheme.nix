{
  flake.modules.nixos.theming_matugen = {
    confDir,
    config,
    inputs,
    pkgs,
    ...
  }: let
    # Intentionally nixified variables
    dest = "${confDir}/.images/wallpaper.png";
    magick = "${pkgs.imagemagick}/bin/magick";
    matugen = "${inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/matugen";
    rebuildCmd =
      if config.hm.programs.nh.enable
      then "nh os switch"
      else "sudo nixos-rebuild switch --flake ${confDir}";

    # Some variables live here, because
    # nixd (or nil, idk, I have both)
    # complains otherwise
    bold = "\\033[1m";
    green = "\\033[1;32m";
    magenta = "\\033[1;35m";
    red = "\\033[1;31m";
    reset = "\\033[0m";

    retheme = pkgs.writeShellScriptBin "retheme" ''
      set -euo pipefail

      ### Utility
      info() { echo -e "${magenta}i${reset} ${bold}$*${reset}"; }
      success() { echo -e "${green}*${reset} ${bold}$*${reset}"; }
      error() {
      	echo -e "${red}X${reset} ${bold}$*${reset}"
      	exit 1
      }

      ### Parsing
      KEYWORD=""
      WALLPAPER=""
      REBUILD=false
      MODE="dark"

      parse_args() {
        # First arg is always a keyword
        [[ $# -gt 0 ]] && { KEYWORD="$1"; shift; }

        for arg in "$@"; do
          case "$arg" in
            -r|--rebuild) REBUILD=true ;;
            --light)      MODE="light" ;;
            --dark)       MODE="dark" ;;
            -*) error "Unknown flag: $arg" ;;
            *)  WALLPAPER="$arg" ;;
          esac
        done
      }

      ### Validation
      validate() {
        if [[ $EUID -eq 0 ]]; then
          error "Do not run retheme as root"
        fi

        if [[ -z "$KEYWORD" ]]; then
          error "Usage: retheme <test|apply> <wallpaper> [--light|--dark] [-r]"
        fi

        if [[ "$KEYWORD" != "test" && "$KEYWORD" != "apply" ]]; then
          error "Unknown keyword '$KEYWORD'. Use 'test' or 'apply'"
        fi

        if [[ -z "$WALLPAPER" ]]; then
          error "No wallpaper provided"
        fi

        if [[ ! -f "$WALLPAPER" ]]; then
          error "File not found: $WALLPAPER"
        fi

        if [[ "$REBUILD" == true && "$KEYWORD" == "test" ]]; then
          error "--rebuild is only valid with 'apply'"
        fi
      }

      ### Test mode
      run_test() {
      	info "Preview [$MODE]: $WALLPAPER"
      	"${matugen}" image "$WALLPAPER" --mode "$MODE" --dry-run --show-colors
      }

      ### Apply mode
      run_apply() {
      	info "Converting wallpaper..."
      	"${magick}" "$WALLPAPER" "${dest}"
      	success "Saved to ${dest}"

      	info "Generating palette [$MODE]..."
      	"${matugen}" image "$WALLPAPER" --mode "$MODE"
      	success "Palette written"

      	if [[ "$REBUILD" == true ]]; then
      		info "Rebuilding..."
      		${rebuildCmd}
      		success "Done"
      	else
      		info "Rebuild to apply"
      	fi
      }

      ### Run
      run() {
      	case "$KEYWORD" in
      	test) run_test ;;
      	apply) run_apply ;;
      	esac
      }

      ### Main
      parse_args "$@"
      validate
      run
    '';
  in {
    hm.home.packages = [retheme];

    # "...All this just to generate a palette? Are you insane?!"
    # Well, kind of. I wanted a nice script, so I wrote a nice script.
    # I mean, have you seen my install.sh?
    # Same story.
  };
}
