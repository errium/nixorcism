{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      fontSize = 28;
    };

    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
  };
}
