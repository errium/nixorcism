{
  flake.modules.nixos.virtual-nix = {
    imports = [./_hardware.nix];

    system.stateVersion = "25.11";

    nixorcism = {
      bootloader = "limine";
      preservation.enable = true;
      sway.extraConfig = ''output Virtual-1 mode 2048x1152'';
    };
  };
}
