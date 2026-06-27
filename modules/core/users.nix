{
  flake.modules.nixos.core = {
    config,
    username,
    ...
  }: let
    # Uses a hashed password if one exists (preservation-aware),
    # otherwise falls back to an initial password.
    passwordFor = name: let
      base =
        if config.nixorcism.preservation.enable
        then "/persistent/etc/passwords"
        else "/etc/passwords";
      file = "${base}/${name}";
    in
      if builtins.pathExists file
      then {hashedPasswordFile = file;}
      else {initialPassword = "nixos";};
  in {
    users.users = {
      ${username} =
        {
          isNormalUser = true;
          description = "${username}";

          extraGroups = [
            "dialout"
            "networkmanager"
            "render"
            "video"
            "wheel"
          ];
        }
        // passwordFor username;

      root = passwordFor "root";
    };
  };
}
