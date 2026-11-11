{inputs, ...}: {
  flake.modules.nixos.probably-prod = {
    imports = [inputs.disko.nixosModules.disko];

    # Test system drive:
    disko.devices.disk.main = {
      device = "/dev/disk/by-id/nvme-PC_SN740_NVMe_WD_512GB_24271N802008_1";
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

    # Test system pool:
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
  };
}
