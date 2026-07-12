{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      desktop-environment'xfce
      display-manager'ly
      shell'fish
      program'git
      program'helix
      program'shell-utils
    ];
  };
}
