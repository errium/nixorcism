{
  flake.modules.nixos.base = {
    hm = {config, ...}: let
      home = config.home.homeDirectory;
    in {
      xdg.userDirs = {
        enable = true;
        createDirectories = true;

        desktop = "${home}/Desktop";
        documents = "${home}/Documents";
        download = "${home}/Downloads";
        music = "${home}/Music";
        pictures = "${home}/Pictures";
        publicShare = "${home}/Public";
        templates = "${home}/Templates";
        videos = "${home}/Videos";
      };

      gtk.gtk3.bookmarks = [
        "file://${home}/Desktop"
        "file://${home}/Documents"
        "file://${home}/Downloads"
        "file://${home}/Music"
        "file://${home}/Pictures"
        "file://${home}/Videos"
      ];
    };
  };
}
