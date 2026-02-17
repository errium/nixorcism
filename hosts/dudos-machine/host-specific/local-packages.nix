{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    # CLI & TUI
    kew
    terminal-toys

    # GUI
    bitwarden-desktop
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

    # Rust
    rustlings
    rustup
  ];
}
