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
        useOSProber = lib.mkDefault true;
        fontSize = 28;
      };

      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };
  };
}
