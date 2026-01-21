{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    # CLI
    figlet
    terminal-toys
    toilet
    tty-clock

    # GUI
    bitwarden-desktop
    feishin
    gajim
    inkscape
    jetbrains.rust-rover
    obs-studio
    protonvpn-gui
    telegram-desktop

    # Go
    gcc
    go

    # Rust
    rustup
  ];
}
