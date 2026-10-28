{
  flake.modules.nixos.services'syncthing = {config, ...}: let
    inherit (config.nixorcism) username;
    home = config.users.users.${username}.home;
  in {
    services.syncthing = {
      enable = true;

      user = username;
      group = "users";
      dataDir = home;
      configDir = "${home}/.local/state/syncthing";
      openDefaultPorts = true;

      overrideDevices = false;
      overrideFolders = false;

      settings.options.urAccepted = -1;
    };

    nixorcism.preserve.user.directories = [
      # ".config/syncthing"
      ".local/state/syncthing"
    ];
  };
}
