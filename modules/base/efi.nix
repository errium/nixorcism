{
  flake.modules.nixos.base = {
    boot.loader.efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
  };
}
