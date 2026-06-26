{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {pkgs, ...}: {
    imports = [inputs.disko.nixosModules.disko];

    fileSystems."/nix".neededForBoot = true;
    fileSystems."/persistent".neededForBoot = true;

    # TODO: move to a separate module.
    # ZFS stuff
    networking.hostId = "00000000";
    boot.supportedFilesystems = ["zfs"];
    boot.zfs = {
      devNodes = "/dev/disk/by-partlabel";
      forceImportRoot = true;
    };
    services.zfs.autoScrub = {
      enable = true;
      interval = "monthly";
    };

    # TODO: move to a separate module.
    # Rollback service
    boot.initrd.systemd = {
      enable = true;
      services.rollback = {
        description = "Rollback root dataset";
        wantedBy = ["initrd.target"];
        after = ["zfs-import-zroot.service" "zfs-import.service"];
        before = ["sysroot.mount"];
        path = [pkgs.zfs];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''zfs rollback -r zroot/root@blank'';
      };
    };

    # Disk & partitions
    disko.devices.disk.main = {
      device = "/dev/vda";
      type = "disk";
      content.type = "gpt";

      content.partitions.esp = {
        priority = 1;
        size = "256M";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
          mountOptions = ["umask=0077"];
        };
      };

      content.partitions.root = {
        size = "100%";
        content = {
          type = "zfs";
          pool = "zroot";
        };
      };
    };

    # zroot pool
    disko.devices.zpool.zroot = {
      type = "zpool";
      rootFsOptions = {
        acltype = "posixacl";
        atime = "off";
        compression = "zstd";
        dnodesize = "auto";
        mountpoint = "none";
        xattr = "sa";
      };
      options = {
        ashift = "12";
        autotrim = "on";
      };

      datasets = {
        root = {
          type = "zfs_fs";
          mountpoint = "/";
          postCreateHook = "zfs snapshot zroot/root@blank";
        };
        nix = {
          type = "zfs_fs";
          mountpoint = "/nix";
          options.atime = "off";
        };
        persistent = {
          type = "zfs_fs";
          mountpoint = "/persistent";
          postCreateHook = "systemd-machine-id-setup --root=/mnt";
        };
      };
    };
  };
}
