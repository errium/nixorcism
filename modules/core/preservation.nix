{
  flake.modules.nixos.core = {username, ...}: {
    preservation = {
      enable = true;

      preserveAt."/persistent" = {
        directories = [
          "/etc/NetworkManager/system-connections"
          "/tmp"
          "/var/lib/bluetooth"
          "/var/lib/nixos"
          "/var/lib/systemd/timers"
          "/var/log"
        ];

        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
        ];
      };

      users.${username} = {
        directories = [
          "Desktop"
          "Documents"
          "Downloads"
          "Music"
          "Pictures"
          "Videos"
        ];

        files = [];
      };
    };
  };
}
