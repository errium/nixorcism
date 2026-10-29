{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      # modules/desktop/
      desktop-environments'xfce
      display-managers'gdm

      # modules/programs/
      programs'fastfetch
      programs'foot
      programs'git
      programs'helium
      programs'helix
      programs'nix-utils
      programs'opencode
      programs'shell-utils

      services'glance

      # modules/shell/
      prompts'starship
      shells'fish
    ];
  };
}
