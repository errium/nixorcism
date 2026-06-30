{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = [inputs.disko.nixosModules.disko];

    fileSystems."/persistent".neededForBoot = true;
    boot.zfs.devNodes = "/dev/disk/by-partlabel"; # VM specific

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
        };
      };
    };
  };
}
