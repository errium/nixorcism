{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    bootloader = config.nixorcism.bootloader;
  in {
    # No default here on purpose.
    # I couldn't figure out a nice way to make this yell at me when it's not set
    # correctly, so I just removed the default.
    options.nixorcism.bootloader = lib.mkOption {
      type = lib.types.enum [
        "grub"
        "limine"
        "systemd-boot"
      ];
      description = "Bootloader to use. Must be set explicitly per host.";
    };

    config = {
      # Common
      boot.loader = {
        timeout = 2;
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot";
      };

      # Loader specific
      boot.loader.grub = lib.mkIf (bootloader == "grub") {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };

      boot.loader.limine = lib.mkIf (bootloader == "limine") {
        enable = true;
        efiSupport = true;
        maxGenerations = 50;
        style.wallpapers = [];
      };

      boot.loader.systemd-boot = lib.mkIf (bootloader == "systemd-boot") {
        enable = true;
      };
    };
  };
}
