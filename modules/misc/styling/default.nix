{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./additions
    ./fonts.nix
    ./stylix.nix
    ./targets.nix
  ];

  options.nixorcism.misc.styling = {
    enable = lib.mkEnableOption "system styling";
  };

  config = lib.mkIf config.nixorcism.misc.styling.enable {
    hm = {
      home.pointerCursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      gtk = {
        iconTheme.name = "Adwaita";
        iconTheme.package = pkgs.adwaita-icon-theme;
      };
    };
  };
}
