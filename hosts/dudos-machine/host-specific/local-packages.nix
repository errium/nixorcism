{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    # CLI & TUI
    gcc
    kew
    terminal-toys

    # GUI
    bitwarden-desktop
    discord
    element-desktop
    eog
    feishin
    gajim
    # inkscape
    monero-gui
    obs-studio
    onlyoffice-desktopeditors
    protonvpn-gui
    sushi
    telegram-desktop

    # Go
    # golangci-lint
    # gotests

    # Rust
    jetbrains.rust-rover
    rustlings
    rustup
  ];
}
