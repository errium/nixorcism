{
  flake.modules.nixos.bootloader_limine = {
    imports = [./_shared.nix];

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
