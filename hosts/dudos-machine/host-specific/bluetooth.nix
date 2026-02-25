{
  flake.modules.nixos.dudos-machine = {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = false;
        };
      };
    };
  };
}
