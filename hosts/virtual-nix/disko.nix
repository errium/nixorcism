{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = [inputs.disko.nixosModules.disko];

    networking.hostId = "06c3936a";
    boot.supportedFilesystems = ["zfs"];
    boot.zfs.devNodes = "/dev/disk/by-partlabel";
    boot.zfs.forceImportRoot = true;
    services.zfs.autoScrub = {
      enable = true;
      interval = "monthly";
    };

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
          options.mountpoint = "legacy";
        };
        home = {
          type = "zfs_fs";
          mountpoint = "/home";
          options.mountpoint = "legacy";
        };
        nix = {
          type = "zfs_fs";
          mountpoint = "/nix";
          options.mountpoint = "legacy";
        };
      };
    };
  };
}
