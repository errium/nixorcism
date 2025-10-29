{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];

  options.nixorcism.desktop = {
    niri.enable = lib.mkEnableOption "Enables niri";
  };

  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    nixpkgs.overlays = [inputs.niri.overlays.niri];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = "gtk gnome";
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";
          "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
        };
        niri.default = [
          "gtk"
          "gnome"
          "wlr"
        ];

        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          xdg-desktop-portal-wlr
          xdg-desktop-portal
        ];
      };
    };

    systemd.user.services.xdg-desktop-portal.after = ["niri.service"];
    systemd.user.services.xdg-desktop-portal-gnome.after = ["niri.service"];
  };
}
