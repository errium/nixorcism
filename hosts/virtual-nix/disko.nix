{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = [inputs.disko.nixosModules.disko];

    # ZFS stuff
    boot.supportedFilesystems = ["zfs"];
    services.zfs.autoScrub = {
      enable = true;
      interval = "monthly";
    };

    # Main disk layout
    disko.devices.disk.main = {
      device = "/dev/vda";
      type = "disk";
      content.type = "gpt";

      # EFI partiton
      content.partitions.esp = {
        size = "256M";
        type = "EF00";
        priority = 1;
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
          mountOptions = ["umask=0077"];
        };
      };

      # ZFS root partition
      content.partitions.root = {
        size = "100%";
        content = {
          type = "zfs";
          pool = "zroot";
        };
      };
    };

    # Main ZFS pool
    disko.devices.zpool.zroot = {
      type = "zpool";
      rootFsOptions.compression = "zstd";
      mountpoint = "/";

      datasets = {
        home = {
          type = "zfs_fs";
          mountpoint = "/home";
        };
        nix = {
          type = "zfs_fs";
          mountpoint = "/nix";
          options.atime = "off";
        };
      };
    };
  };
}
