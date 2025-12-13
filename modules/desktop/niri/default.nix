{
  pkgs,
  config,
  lib,
  username,
  ...
}: {
  options.nixorcism.desktop = {
    niri.enable = lib.mkEnableOption "Enables niri";
  };

  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    programs.niri = {
      enable = true;
    };

    # FIX
    # hm.home.file.".config/niri/config.kdl".source =
    #   config.lib.file.mkOutOfStoreSymlink
    #   /home/${username}/nixorcism/modules/desktop/niri/config.kdl;

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = "gtk gnome";
          "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";
        };
        niri.default = [
          "gtk"
          "gnome"
          "wlr"
        ];
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };

    systemd.user.services.xdg-desktop-portal.after = ["niri.service"];
    systemd.user.services.xdg-desktop-portal-gnome.after = ["niri.service"];
  };
}
