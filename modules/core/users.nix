{
  flake.modules.nixos.core = {username, ...}: {
    users.mutableUsers = false;

    users.users = {
      root.initialPassword = "nixos";

      ${username} = {
        isNormalUser = true;
        description = "${username}";
        initialPassword = "nixos";

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
