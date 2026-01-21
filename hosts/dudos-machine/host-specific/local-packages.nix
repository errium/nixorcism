{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    bitwarden-desktop
    feishin
    figlet
    gajim
    gcc
    go
    inkscape
    jetbrains.rust-rover
    obs-studio
    protonvpn-gui
    telegram-desktop
    terminal-toys
    toilet
    tty-clock
  ];
}
