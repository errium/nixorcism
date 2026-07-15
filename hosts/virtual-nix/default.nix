{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      shell'fish

      desktop-environments'xfce
      display-managers'ly

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
