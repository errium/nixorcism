{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    preservation = config.nixorcism.preservation;
    passwordRoot =
      if preservation.enable
      then "/persistent/etc/passwords"
      else "/etc/passwords";
  in {
    options.nixorcism.username = lib.mkOption {
      type = lib.types.str;
      default = "errium"; # Personal default.
      description = "Username of the primary user.";
    };

    config = {
      # Feels a bit out of place in a users.nix file,
      # but without it no user can log in.
      fileSystems."/persistent".neededForBoot =
        lib.mkIf preservation.enable (lib.mkDefault true);
      nixorcism.preserve.directories = ["/etc/passwords"];

      users.users = {
        root.hashedPasswordFile = "${passwordRoot}/root";

        ${config.nixorcism.username} = {
          isNormalUser = true;
          description = config.nixorcism.username;
          hashedPasswordFile = "${passwordRoot}/${config.nixorcism.username}";
          extraGroups = ["dialout" "networkmanager" "render" "video" "wheel"];
        };
      };
    };
  };
}
