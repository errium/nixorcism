{
  flake.modules.nixos.dudos-machine = {
    config,
    lib,
    ...
  }: {
    boot.resumeDevice =
      (lib.findFirst
        (d: lib.hasPrefix "/dev/disk/by-uuid" d.device)
        null
        config.swapDevices).device;

    services.logind.settings.Login = {
      LidSwitch = "suspend-then-hibernate";
      LidSwitchExternalPower = "suspend";
    };

    systemd.sleep.settings.Sleep.HibernateDelaySec = "15m";
  };
}
