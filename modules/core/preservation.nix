{inputs, ...}: {
  flake.modules.nixos.core = {
    config,
    lib,
    pkgs,
    ...
  }: let
    preserve = config.nixorcism.preserve;
    preserveType = lib.types.listOf (lib.types.either lib.types.str lib.types.attrs);
    username = config.nixorcism.username;
  in {
    imports = [inputs.preservation.nixosModules.preservation];

    options.nixorcism = {
      preservation = {enable = lib.mkEnableOption "preservation";};

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
      systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

      # NOTE: "/persistent" is hardcoded, since that's the only name I use.
      preservation.preserveAt."/persistent" = {
        commonMountOptions = [
          "x-gdu.hide"
          "x-gvfs-hide"
        ];

        # System-level preservation + defaults
        directories =
          [
            "/var/lib/nixos"
            "/var/lib/systemd/coredump"
            "/var/lib/systemd/timers"
            "/var/log"
          ]
          ++ preserve.directories;

        files =
          [
            {
              file = "/etc/machine-id";
              inInitrd = true;
            }
          ]
          ++ preserve.files;

        # User-level preservation + defaults
        users.${username} = {
          directories =
            [
              "Desktop"
              "Documents"
              "Downloads"
              "Music"
              "Pictures"
              "Projects"
              "Videos"
            ]
            ++ preserve.user.directories;

          files = preserve.user.files;
        };
      };

      # A little wacky script to find what's unpersistent
      environment.systemPackages = [
        (pkgs.writeShellScriptBin "find-unpersisted" ''
          sudo ${pkgs.rsync}/bin/rsync -amvxx \
            --dry-run \
            --no-links \
            --exclude '/dev/*' \
            --exclude '/proc/*' \
            --exclude '/root/*' \
            --exclude '/run/*' \
            --exclude '/sys/*' \
            --exclude '/tmp/*' \
            / /persistent/ \
            | ${pkgs.ripgrep}/bin/rg -v '^skipping|/$'
        '')
      ];
    };
  };
}
