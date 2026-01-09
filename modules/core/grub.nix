{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.nixorcism.core.bootloader == "grub") {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        fontSize = 28;
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
