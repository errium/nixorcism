{
  time.timeZone = "Europe/Vilnius";

  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ru_RU.UTF-8/UTF-8"
  ];

  hm.home.language = {
    base = "ru_RU.UTF-8";
    messages = "ru_RU.UTF-8";
    address = "en_US.UTF-8";
    monetary = "en_US.UTF-8";
    paper = "en_US.UTF-8";
    name = "en_US.UTF-8";
  };

  hm.xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    templates = "$HOME/Templates";
    publicShare = "$HOME/Public";
  };
}
