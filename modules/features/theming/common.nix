{
  # NOTE: `theming_common` is NOT meant to be imported manually
  flake.modules.nixos.theming_common = {pkgs, ...}: {
    hm = {
      home.pointerCursor = {
        name = "phinger-cursors-light";
        package = pkgs.phinger-cursors;
        size = 22;
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
