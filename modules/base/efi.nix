{
  flake.modules.nixos.base = {
    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
  };
}
