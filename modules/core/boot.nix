{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: {
    options.nixorcism.bootloader = lib.mkOption {
      description = "Bootloader to use. Must be set explicitly per host.";
      type = lib.types.nullOr (lib.types.enum [
        "grub"
        "limine"
        "systemd-boot"
      ]);
      default = null;
    };

    config = {
      # Common
      boot.tmp.cleanOnBoot = true;
      boot.loader = {
        timeout = 2;
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot";
      };

      # Loader specific
      boot.loader.grub = lib.mkIf (config.nixorcism.bootloader == "grub") {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };

      boot.loader.limine = lib.mkIf (config.nixorcism.bootloader == "limine") {
        enable = true;
        efiSupport = true;
        maxGenerations = 50;
        style.wallpapers = [];
      };

      boot.loader.systemd-boot = lib.mkIf (config.nixorcism.bootloader == "systemd-boot") {
        enable = true;
      };
    };
  };
}
