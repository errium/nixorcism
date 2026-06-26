{
  flake.modules.nixos.core = {
    config,
    lib,
    pkgs,
    ...
  }: {
    options.nixorcism.zfs = {enable = lib.mkEnableOption "ZFS additions";};

    config = lib.mkIf config.nixorcism.zfs.enable (let
      latestZfsKernel =
        pkgs.linuxKernel.packages
        |> lib.filterAttrs (name: kernelPackages:
          (builtins.match "linux_[0-9]+_[0-9]+" name)
          != null
          && (builtins.tryEval kernelPackages).success
          && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken))
        |> builtins.attrValues
        |> lib.sort (a: b: lib.versionOlder a.kernel.version b.kernel.version)
        |> lib.last;
    in {
      networking.hostId = lib.mkDefault "00000000";

      boot.kernelPackages = latestZfsKernel; # No lib.mkDefault because I want them to collide.
      boot.supportedFilesystems = ["zfs"];
      boot.zfs.forceImportRoot = true;

      services.zfs.autoScrub = {
        enable = true;
        interval = "monthly";
      };

      # Rollback root dataset to blank snapshot on every boot
      # NOTE: zroot, /root and @blank are hardcoded on purpose. I won't need to change them ever.
      boot.initrd.systemd = lib.mkIf config.nixorcism.preservation.enable {
        enable = true;
        services.rollback = {
          description = "Rollback root dataset";
          wantedBy = ["initrd.target"];
          after = ["zfs-import-zroot.service" "zfs-import.service"];
          before = ["sysroot.mount"];
          path = [pkgs.zfs];
          unitConfig.DefaultDependencies = "no";
          serviceConfig.Type = "oneshot";
          script = "zfs rollback -r zroot/root@blank";
        };
      };
    });
  };
}
