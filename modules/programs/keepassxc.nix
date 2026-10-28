{
  flake.modules.nixos.programs'keepassxc = {
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

    nixorcism.preserve.user.directories = [".keepass"];
  };
}
