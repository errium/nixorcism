{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      desktop-environments'xfce
      display-managers'ly

      shell'fish

      system'theming

      programs'comma
      programs'fastfetch
      programs'foot
      programs'git
      programs'helix
      programs'nix-utils
      programs'shell-utils
      programs'starship
    ];
  };
}
