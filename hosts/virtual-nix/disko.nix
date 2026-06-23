{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = [inputs.disko.nixosModules.disko];

    fileSystems."/persistent".neededForBoot = true;

    # tmpfs root
    disko.devices.nodev."/" = {
      fsType = "tmpfs";
      mountOptions = ["size=25%" "mode=755"];
    };

    # Actual drive
    disko.devices.disk.main = {
      # Common
      device = "/dev/vda";
      type = "disk";
      content.type = "gpt";

      # boot partition
      content.partitions.esp = {
        size = "256M";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
          mountOptions = ["umask=0077"];
        };
      };

      # persistent root
      content.partitions.root = {
        size = "100%";
        content = {
          type = "btrfs";
          extraArgs = ["-L" "nixos" "-f"];
          subvolumes = {
            "/persistent" = {
              mountpoint = "/persistent";
              mountOptions = ["subvol=persistent" "compress=zstd" "noatime"];
            };
            "/nix" = {
              mountpoint = "/nix";
              mountOptions = ["subvol=nix" "compress=zstd" "noatime"];
            };
          };
        };
      };
    };
  };
}
