{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      desktop-environments'xfce
      display-managers'ly

      programs'fastfetch
      programs'foot
      programs'git
      programs'helium
      programs'helix
      programs'nix-utils
      programs'shell-utils
      programs'starship

      shell'fish
    ];
  };
}
