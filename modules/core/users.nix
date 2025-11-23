{
  config,
  lib,
  username,
  ...
}: {
  users.users = let
    keyExists = builtins.pathExists "/home/${username}/.config/sops/age/keys.txt";
  in {
    root = {
      hashedPasswordFile =
        lib.mkIf keyExists
        config.sops.secrets.root-password.path;
      initialHashedPassword =
        lib.mkIf (!keyExists)
        "$y$j9T$7uBk7C2pQGx3Wt0JxNB5W/$FtEF1HGlK.Qozr0E2tiLGu78X4ujtVyjfN8zVeTa0l5";
    };

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