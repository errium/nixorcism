{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.nixorcism.core.bootloader == "grub") {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        font = lib.mkForce "${pkgs.grub2}/share/grub/unicode.pf2";
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
