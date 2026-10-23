{config, ...}: {
  flake.modules.nixos.dudos-machine = {
    imports = with config.flake.modules.nixos; [
      display-managers'ly
      window-managers'swayfx

      programs'cava
      programs'fastfetch
      programs'foot
      programs'git
      programs'helium
      programs'helix
      programs'nix-utils
      programs'openrgb
      programs'shell-utils
      programs'starship

      shell'fish

      system'bluetooth
      system'hardening
    ];
  };
}
