{
  flake.modules.nixos.core = {
    config,
    lib,
    username,
    ...
  }: let
    cfg = config.nixorcism.preservation;
    passwordRoot =
      if cfg.enable
      then "/persistent/etc/passwords"
      else "/etc/passwords";
  in {
    nixorcism.preserve.directories = ["/etc/passwords"];
    # This seems like a questionable move,
    # but without it you can't log in as any user.
    fileSystems."/persistent".neededForBoot = lib.mkIf cfg.enable (lib.mkDefault true);

    users.users = {
      root.hashedPasswordFile = "${passwordRoot}/root";

      ${username} = {
        isNormalUser = true;
        description = "${username}";
        hashedPasswordFile = "${passwordRoot}/user";
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
}
