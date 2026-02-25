{
  flake.modules.nixos.bootloader_limine = {
    boot.loader = {
      limine = {
        enable = true;
        efiSupport = true;
        maxGenerations = 50;

        style = {
          wallpapers = [];
        };
      };
    };
  };
}
