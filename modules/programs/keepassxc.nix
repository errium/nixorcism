{
  flake.modules.nixos.programs'keepassxc = {config, ...}: {
    hj.rum.programs.keepassxc = {
      enable = true;

      settings.General = {
        ConfigVersion = 2;
        AutoReloadOnChange = true;
        AutoSaveAfterEveryChange = true;
        AutoSaveOnExit = true;
        BackupBeforeSave = true;
        SingleInstance = true;
      };

      settings.GUI = {
        ColorPasswords = true;
        MinimizeToTray = true;
        MonospaceNotes = true;
        ShowTrayIcon = true;
        TrayIconAppearance = "colorful";
      };

      settings.Security = {
        ClearClipboard = true;
        ClearClipboardTimeout = 30;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 300;
        LockDatabaseMinimize = false;
      };
    };

    # TODO: Finish
    services.syncthing = let
      username = config.nixorcism.username;
      home = "/home/${username}";
    in {
      enable = true;
      user = username;
      group = "users";
      dataDir = home;
      configDir = "${home}/.config/syncthing";
      openDefaultPorts = true;
    };

    nixorcism.preserve.user.directories = [
      ".config/syncthing"
      ".keepass"
    ];
  };
}
