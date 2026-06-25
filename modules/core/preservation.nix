{inputs, ...}: {
  flake.modules.nixos.core = {
    config,
    confDir,
    lib,
    username,
    ...
  }: let
    conf = baseNameOf confDir;
    mount = config.nixorcism.preservation.mountPoint;
    preserve = config.nixorcism.preserve;
    preserveType = lib.types.listOf (lib.types.either lib.types.str lib.types.attrs);
  in {
    imports = [inputs.preservation.nixosModules.preservation];

    # Options are always declared so that preserve.* is available
    # regardless of whether preservation is enabled.
    options.nixorcism = {
      preservation = {
        enable = lib.mkEnableOption "preservation";
        mountPoint = lib.mkOption {
          type = lib.types.str;
          default = "/persistent";
        };
      };

      # Traditional preservation syntax works inside of those.
      preserve = {
        # System-level preserve options
        directories = lib.mkOption {
          type = preserveType;
          default = [];
        };
        files = lib.mkOption {
          type = preserveType;
          default = [];
        };

        # User-level preserve options
        user.directories = lib.mkOption {
          type = preserveType;
          default = [];
        };
        user.files = lib.mkOption {
          type = preserveType;
          default = [];
        };
      };
    };

    config = lib.mkIf config.nixorcism.preservation.enable {
      preservation.enable = true;

      preservation.preserveAt.${mount} = {
        commonMountOptions = [
          "x-gdu.hide"
          "x-gvfs-hide"
        ];

        # System-level preservation + defaults
        directories = lib.mkMerge [
          [
            "/etc/NetworkManager/system-connections"
            "/var/lib/bluetooth"
            "/var/lib/nixos"
            "/var/lib/systemd/coredump"
            "/var/lib/systemd/timers"
            "/var/log"
          ]
          preserve.directories
        ];

        files = lib.mkMerge [
          ["/etc/machine-id"]
          preserve.files
        ];

        # User-level preservation + defaults
        users.${username} = {
          directories = lib.mkMerge [
            [
              "${conf}"
              "Desktop"
              "Documents"
              "Downloads"
              "Music"
              "Pictures"
              "Projects"
              "Videos"
            ]
            preserve.user.directories
          ];

          files = lib.mkMerge [
            []
            preserve.user.files
          ];
        };
      };
    };
  };
}
