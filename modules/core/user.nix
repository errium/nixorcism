{
  config,
  lib,
  username,
  ...
}: {
  users.users = let
    keyExists = builtins.pathExists "/home/${username}/.config/sops/age/keys.txt";
  in {
    ${username} = {
      isNormalUser = true;
      description = "Errium";

      hashedPasswordFile =
        lib.mkIf keyExists
        config.sops.secrets.user-password.path;
      initialHashedPassword =
        lib.mkIf (!keyExists)
        "$y$j9T$Hao7G9TGibBoEN6X1d2sW0$kemp6XaOm1RYTRWC4M0qvqJzTuwy2eO.wYpg3wQeQi5";

      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "sound"
        "video"
        "render"
      ];
    };
  };
}
