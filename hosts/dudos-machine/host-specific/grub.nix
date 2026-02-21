{
  flake.modules.nixos.dudos-machine = {
    boot.loader.grub.useOSProber = true;
  };
}
