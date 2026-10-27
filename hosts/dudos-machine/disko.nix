{inputs, ...}: {
  flake.modules.nixos.dudos-machine = {
    imports = [inputs.disko.nixosModules.disko];

    # main drive:
    disko.devices.disk.main = {
      device = "/dev/disk/by-id/nvme-SKHynix_HFS512GEJ9X115N_SJB9N653014209N4Q_1";
      type = "disk";
      content.type = "gpt";

      content.partitions.esp = {
        priority = 1;
        size = "2G";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
          mountOptions = ["umask=0077"];
        };
      };

      content.partitions.swap = {
        priority = 2;
        size = "8G";
        content.type = "swap";
      };

      content.partitions.root = {
        priority = 3;
        size = "100%";
        content = {
          type = "zfs";
          pool = "zroot";
        };
      };
    };

    # main pool:
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

      datasets.root = {
        type = "zfs_fs";
        mountpoint = "/";
        postCreateHook = "zfs snapshot zroot/root@blank";
      };

      datasets.nix = {
        type = "zfs_fs";
        mountpoint = "/nix";
        options.atime = "off";
      };

      datasets.persistent = {
        type = "zfs_fs";
        mountpoint = "/persistent";
      };
    };

    # storage drive:
    # kept outside the main pool and its rollback snapshots
    disko.devices.disk.storage = {
      device = "/dev/disk/by-id/nvme-PC_SN740_NVMe_WD_512GB_24271N802008_1";
      type = "disk";
      content.type = "gpt";

      content.partitions.storage = {
        size = "100%";
        content = {
          type = "zfs";
          pool = "zstorage";
        };
      };
    };

    # storage pool:
    # mounted at /storage and unaffected by root rollback
    disko.devices.zpool.zstorage = {
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

      datasets.storage = {
        type = "zfs_fs";
        mountpoint = "/storage";
      };
    };
  };
}
