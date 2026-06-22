{inputs, ...}: {
  flake.modules.nixos.core = {
    config,
    lib,
    username,
    ...
  }: let
    p = config.nixorcism.persist;
    persistType = lib.types.listOf (lib.types.either lib.types.str lib.types.attrs);
  in {
    imports = [inputs.impermanence.nixosModules.impermanence];

    # Toggle logic is always active so that nixorcism.persist.* options
    # are always available, even when impermanence is disabled.
    options.nixorcism = {
      impermanence.enable = lib.mkEnableOption "impermanence";

      # Traditional impermanence syntax works inside of those.
      persist = {
        # System-level persistence options
        directories = lib.mkOption {
          type = persistType;
          default = [];
        };
        files = lib.mkOption {
          type = persistType;
          default = [];
        };

        # User-level persistence options
        user.directories = lib.mkOption {
          type = persistType;
          default = [];
        };
        user.files = lib.mkOption {
          type = persistType;
          default = [];
        };
      };
    };

    config = lib.mkIf config.nixorcism.impermanence.enable {
      environment.persistence."/persistent" = {
        # Common
        enable = true;
        hideMounts = true;

        # System-level persistence + defaults
        directories = lib.mkMerge [
          [
            "/etc/NetworkManager/system-connections"
            "/tmp"
            "/var/lib/bluetooth"
            "/var/lib/nixos"
            "/var/lib/systemd/coredump"
            "/var/lib/systemd/timers"
            "/var/log"
          ]
          p.directories
        ];

        files = lib.mkMerge [
          [
            "/etc/machine-id"
          ]
          p.files
        ];

        # User-level persistence + defaults
        users.${username} = {
          directories = lib.mkMerge [
            [
              "Desktop"
              "Documents"
              "Downloads"
              "Music"
              "Pictures"
              "Projects"
              "Public"
              "Templates"
              "Videos"
              "nixorcism" # TODO: Make it failsafe
            ]
            p.user.directories
          ];

          files = lib.mkMerge [
            []
            p.user.files
          ];
        };
      };
    };
  };
}
