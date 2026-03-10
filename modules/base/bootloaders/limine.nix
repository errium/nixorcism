{config, ...}: {
  flake.modules.nixos.bootloader_limine = {
    imports = with config.flake.modules.nixos; [bootloader_common];

    boot.loader.limine = {
      enable = true;
      efiSupport = true;
      maxGenerations = 50;

      style = {
        wallpapers = [];
      };
    };
  };
}
