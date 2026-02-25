{
  flake.modules.nixos.bootloader_grub = {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };
}
