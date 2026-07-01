{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    cfg = config.nixorcism.preservation;
    passwordRoot =
      if cfg.enable
      then "/persistent/etc/passwords"
      else "/etc/passwords";
  in {
    options.nixorcism.username = lib.mkOption {
      type = lib.types.str;
      description = "Primary user. Must be set explicitly.";
    };

    config = {
      # I'm setting my username right here, because I want it
      # to be the same for all hosts.
      nixorcism.username = "errium";

      # This seems like a questionable move,
      # but without it you can't log in as any user.
      fileSystems."/persistent".neededForBoot = lib.mkIf cfg.enable (lib.mkDefault true);
      nixorcism.preserve.directories = ["/etc/passwords"];

      users.users = {
        root.hashedPasswordFile = "${passwordRoot}/root";

        ${config.nixorcism.username} = {
          isNormalUser = true;
          description = "${config.nixorcism.username}";
          hashedPasswordFile = "${passwordRoot}/${config.nixorcism.username}";
          extraGroups = [
            "dialout"
            "networkmanager"
            "render"
            "video"
            "wheel"
          ];
        };
      };
    };
  };
}
