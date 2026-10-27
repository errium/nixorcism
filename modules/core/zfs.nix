{
  flake.modules.nixos.core = {
    config,
    lib,
    pkgs,
    ...
  }: let
    isZfsRoot =
      config.disko.devices.disk.main.content.partitions.root.content.type == "zfs";

    latestZfsKernel = let
      zfsModule = config.boot.zfs.package.kernelModuleAttribute;
      isMainline = name: builtins.match "linux_[0-9]+_[0-9]+" name != null;
      isUsable = kernel: (builtins.tryEval kernel).success && !kernel.${zfsModule}.meta.broken;
    in
      pkgs.linuxKernel.packages
      |> lib.filterAttrs (name: kernel: isMainline name && isUsable kernel)
      |> builtins.attrValues
      |> lib.sort (a: b: lib.versionOlder a.kernel.version b.kernel.version)
      |> lib.last;
  in {
    config = lib.mkIf isZfsRoot {
      networking.hostId = "00000000";

      boot = {
        # No lib.mkDefault because I want them to collide.
        kernelPackages = latestZfsKernel;
        supportedFilesystems = ["zfs"];
        zfs.forceImportRoot = true;
      };

      services.zfs.autoScrub = {
        enable = true;
        interval = "monthly";
      };

      # Rollback root dataset to blank snapshot on every boot
      # NOTE: zroot, /root and @blank are hardcoded on purpose. I won't need to change them ever.
      boot.initrd.systemd.services.rollback = lib.mkIf config.nixorcism.preservation.enable {
        description = "ZFS rollback to @blank";
        wantedBy = ["initrd.target"];

        requires = ["zfs-import-zroot.service"];
        after = ["zfs-import-zroot.service"];
        before = ["sysroot.mount"];

        unitConfig.DefaultDependencies = false;
        serviceConfig.Type = "oneshot";

        path = [config.boot.zfs.package];
        script = "zfs rollback -r zroot/root@blank";
      };
    };
  };
}
