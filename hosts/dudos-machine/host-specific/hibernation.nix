{
  flake.modules.nixos.dudos-machine = {
    config,
    lib,
    ...
  }: {
    boot.resumeDevice =
      config.swapDevices
      |> lib.filter (d: lib.hasPrefix "/dev/disk/by-uuid" d.device)
      |> lib.head
      |> (d: d.device);

    services.logind.settings.Login = {
      LidSwitch = "suspend-then-hibernate";
      LidSwitchExternalPower = "suspend";
    };

    systemd.sleep.settings.Sleep.HibernateDelaySec = "15m";
  };
}
