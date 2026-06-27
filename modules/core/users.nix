{
  flake.modules.nixos.core = {username, ...}: {
    users.users = {
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

      root.initialPassword = "nixos";
    };
  };
}
