{inputs, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = [inputs.disko.nixosModules.disko];

    disko.devices.disk.main = {
      device = "/dev/vda";
      type = "disk";
      content.type = "gpt";

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

      content.partitions.root = {
        size = "100%";
        content = {
          type = "filesystem";
          format = "ext4";
          mountpoint = "/";
        };
      };
    };
  };
}
