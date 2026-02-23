{
  flake.modules.nixos.theming_wallust = {
    confDir,
    pkgs,
    ...
  }: let
    bold = "\033[1m";
    green = "\033[1;32m";
    magenta = "\033[1;35m";
    reset = "\033[0m";

    setwp = pkgs.writeShellScriptBin "setwp" ''
      set -e

      WALLPAPER="$1"
      REBUILD=false
      DEST="${confDir}/assets/wallpaper.png"

      if [ -z "$WALLPAPER" ]; then
      	echo -e "${magenta}ℹ${reset} ${bold}setwp <path-to-wallpaper> [--rebuild]${reset}"
      	exit 1
      fi

      if [ "$2" = "--rebuild" ] || [ "$2" = "-r" ]; then
      	REBUILD=true
      fi

      ${pkgs.imagemagick}/bin/magick "$WALLPAPER" "$DEST"
      echo -e "${green}*${reset} ${bold}Wallpaper converted and saved${reset}"

      ${pkgs.wallust}/bin/wallust run "$DEST"
      echo -e "${green}*${reset} ${bold}Palette generated${reset}"

      if [ "$REBUILD" = true ]; then
      	echo -e "${magenta}ℹ${reset} ${bold}Rebuilding...${reset}"
      	nh os switch
      else
      	echo -e "${magenta}ℹ${reset} ${bold}Run 'nh os switch ${confDir}' to apply"
      fi
    '';
  in {
    hm.home.packages = [setwp];
  };
}
