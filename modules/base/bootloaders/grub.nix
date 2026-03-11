{config, ...}: {
  flake.modules.nixos.bootloader_grub = {
    imports = with config.flake.modules.nixos; [bootloader_common];

    boot.loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
  };
}
