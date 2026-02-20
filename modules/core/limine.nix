{
  flake.modules.nixos.limine = {
    boot.loader = {
      limine = {
        enable = true;
        efiSupport = true;
        maxGenerations = 50;

        style = {
          wallpapers = [];
        };
      };

      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };
  };
}
