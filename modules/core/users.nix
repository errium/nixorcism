{
  flake.modules.nixos.core = {username, ...}: {
    users.users = {
      ${username} = {
        isNormalUser = true;
        initialPassword = "nixos";
        description = "${username}";

        extraGroups = [
          "audio"
          "dialout"
          "networkmanager"
          "render"
          "sound"
          "video"
          "wheel"
        ];
      };

      root.initialPassword = "nixos";
    };
  };
}
