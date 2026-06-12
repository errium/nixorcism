{
  flake.modules.nixos.desktop-environment_gnome = {
    config,
    pkgs,
    ...
  }: {
    services.desktopManager.gnome.enable = true;

    # ╺┳┓┏━╸┏┓ ╻  ┏━┓┏━┓╺┳╸╻┏┓╻┏━╸
    #  ┃┃┣╸ ┣┻┓┃  ┃ ┃┣━┫ ┃ ┃┃┗┫┃╺┓
    # ╺┻┛┗━╸┗━┛┗━╸┗━┛╹ ╹ ╹ ╹╹ ╹┗━┛
    services.gnome.core-apps.enable = false;

    services.gnome = {
      gnome-browser-connector.enable = false;
      gnome-initial-setup.enable = false;
      gnome-online-accounts.enable = false;
      gnome-remote-desktop.enable = false;
      gnome-user-share.enable = false;
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-backgrounds
      gnome-tour
      gnome-user-docs
    ];

    services.avahi.enable = false;
    services.power-profiles-daemon.enable = !(config.services.auto-cpufreq.enable or false);
  };
}
