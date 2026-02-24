{
  flake.modules.nixos.wm_niri = {
    config,
    lib,
    pkgs,
    ...
  }: let
    hostname = config.networking.hostName;
    hostConfigPath = ../../../../hosts/${hostname}/host-specific + "/niri-specifics.kdl";
    hostConfig =
      if builtins.pathExists hostConfigPath
      then builtins.readFile hostConfigPath
      else "";

    baseConfig = builtins.readFile ./base.kdl;
    finalConfig = baseConfig + "\n" + hostConfig;
  in {
    programs.niri = {
      enable = true;
      useNautilus = true;
    };

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = "gtk gnome";
          "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
          "org.freedesktop.impl.portal.Screenshot" = "gnome";
        };
        niri.default = lib.mkForce [
          "gnome"
          "gtk"
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

    hm = {
      home.file.".config/niri/config.kdl".text = finalConfig;
      home.packages = with pkgs; [
        brightnessctl
        cliphist
        playerctl
        wl-clip-persist
        wl-clipboard
        xwayland-satellite
      ];
    };
  };
}
