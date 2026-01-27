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
    feishin
    gajim
    inkscape
    monero-gui
    obs-studio
    protonvpn-gui
    telegram-desktop

    # Go
    gcc
    go
    gotests
  ];
}
