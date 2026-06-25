# TEST
{inputs, ...}: {
  flake.modules.nixos.core = {username, ...}: {
    imports = [inputs.preservation.nixosModules.default];

    preservation = {
      enable = true;
      commonMountOptions = [
        "x-gdu.hide"
        "x-gvfs-hide"
      ];

      # System-level persistence
      preserveAt."/persistent" = {
        directories = [
          "/var/log"
          "/var/lib/bluetooth"
          "/var/lib/nixos"
          "/var/lib/systemd/coredump"
          "/etc/NetworkManager/system-connections"
        ];
        files = [
          "/etc/machine-id"
        ];
      };

      # User-level persistence
      preserveAt."/persistent".users.${username} = {
        directories = [
          "nixorcism"
        ];
        files = [];
      };
    };
  };
}
