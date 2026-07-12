{
  flake.modules.nixos.bluetooth = {lib, ...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;

      settings.General = {
        Experimental = true;
        FastConnectable = false;
      };
    };

    systemd.services.bluetooth.wantedBy = lib.mkForce [];

    nixorcism.preserve.directories = ["/var/lib/bluetooth"];
  };
}
