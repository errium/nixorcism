{
  flake.modules.nixos.core = {
    config,
    username,
    ...
  }: let
    passwordRoot =
      if config.nixorcism.preservation.enable
      then "/persistent/etc/passwords"
      else "/etc/passwords";
  in {
    nixorcism.preserve.directories = ["/etc/passwords"];

    users.users.root.hashedPasswordFile = "${passwordRoot}/root";

    users.users.${username} = {
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
}
