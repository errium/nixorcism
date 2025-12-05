{inputs, ...}: {
  imports = [inputs.determinate.nixosModules.default];

  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
