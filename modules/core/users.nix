{
  flake.modules.nixos.core = {
    username,
    config,
    ...
  }: let
    passwordFor = name: let
      path =
        if config.nixorcism.preservation.enable
        then "/persistent/etc/passwords"
        else "/etc/passwords";
      file = "${path}/${name}";
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
