{
  config,
  lib,
  username,
  ...
}: let
  isInitialInstall = builtins.getEnv "NIXOS_INITIAL_INSTALL" == "1";
in {
  users = {
    mutableUsers = false;

    users = {
      root = lib.mkMerge [
        {hashedPasswordFile = config.sops.secrets.root-password.path;}
        (lib.mkIf isInitialInstall {
          initialHashedPassword = "$y$j9T$7uBk7C2pQGx3Wt0JxNB5W/$FtEF1HGlK.Qozr0E2tiLGu78X4ujtVyjfN8zVeTa0l5";
        })
      ];

      ${username} = lib.mkMerge [
        {
          isNormalUser = true;
          description = "Errium";
          hashedPasswordFile = config.sops.secrets.user-password.path;
          extraGroups = [
            "networkmanager"
            "wheel"
            "audio"
            "sound"
            "video"
            "render"
          ];
        }
        (lib.mkIf isInitialInstall {
          initialHashedPassword = "$y$j9T$Hao7G9TGibBoEN6X1d2sW0$kemp6XaOm1RYTRWC4M0qvqJzTuwy2eO.wYpg3wQeQi5";
        })
      ];
    };
  };
}
