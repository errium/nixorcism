{
  flake.modules.nixos.feature_bluetooth = {lib, ...}: {
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

    systemd.services.bluetooth.wantedBy = lib.mkForce [];
  };
}
