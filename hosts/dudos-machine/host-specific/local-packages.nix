{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    # CLI & TUI
    figlet
    kew
    terminal-toys
    toilet
    tty-clock

    # GUI
    bitwarden-desktop
    discord
    element-desktop
    eog
    feishin
    gajim
    inkscape
    monero-gui
    obs-studio
    onlyoffice-desktopeditors
    protonvpn-gui
    sushi
    telegram-desktop

    # Go
    gcc
    golangci-lint
    gotests
  ];
}
