{
  # NOTE: `bootloader_common` is NOT meant to be imported manually
  flake.modules.nixos.bootloader_common = {
    boot.loader = {
      timeout = 2;

      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };
  };
}
