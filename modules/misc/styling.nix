{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.misc = {
    styling.enable = lib.mkEnableOption "Whether to enable additional styling";
  };

  config = lib.mkIf config.nixorcism.misc.styling.enable {
    hm = {
      home.pointerCursor = {
        x11.enable = true;
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        size = 24;
        name = "Bibata-Modern-Ice";
      };

      gtk = {
        enable = true;
        theme.package = pkgs.adw-gtk3;
        theme.name = "adw-gtk3-dark";
        iconTheme.package = pkgs.gruvbox-plus-icons;
        iconTheme.name = "Gruvbox-Plus-Dark";
      };

      qt = {
        enable = true;
        platformTheme.name = "gtk";
        style.name = "adwaita-dark";
      };
    };
  };
}
