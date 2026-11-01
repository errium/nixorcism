{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      # modules/desktop/
      desktop-environments'xfce
      display-managers'ly
      window-managers'swayfx

      # modules/programs/
      programs'fastfetch
      programs'git
      programs'helium
      programs'helix
      programs'nix-utils
      programs'opencode
      programs'shell-utils

      # modules/shell/
      prompts'starship
      shells'fish
    ];
  };
}
