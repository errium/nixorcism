{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = [inputs.disko.nixosModules.disko];

    fileSystems."/nix".neededForBoot = true;

    disko.devices.nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=25%"
          "mode=755"
        ];
      };
    };

    disko.devices.disk.main = {
      device = "/dev/vda";
      type = "disk";
      content.type = "gpt";

      content.partitions.boot = {
        name = "boot";
        size = "2M";
        type = "EF02";
      };

      content.partitions.esp = {
        name = "ESP";
        size = "256M";
        type = "EF00";
        priority = 1;
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
        };
      };

      content.partitions.root = {
        name = "root";
        size = "100%";
        content = {
          type = "btrfs";
          extraArgs = ["-f"];
          subvolumes = {
            "/persistent" = {
              mountOptions = ["subvol=persistent" "noatime"];
              mountpoint = "/persistent";
            };
            "/nix" = {
              mountOptions = ["subvol=nix" "noatime"];
              mountpoint = "/nix";
            };
          };
        };
      };

      content.partitions.swap = {
        size = "2G";
        content = {
          type = "swap";
          resumeDevice = true;
        };
      };
    };
  };
}
