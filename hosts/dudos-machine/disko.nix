{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        # device = "/dev/disk/by-diskseq/1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "2G";
              priority = 1;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };

            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                mountpoint = "/partition-root";
                subvolumes = {
                  "/".mountpoint = "/";
                  "/home".mountpoint = "/home";
                  "/nix".mountpoint = "/nix";
                };
              };
            };

            swap = {
              size = "33G";
              content = {
                type = "swap";
              };
            };
          };
        };
      };
    };
  };
}
