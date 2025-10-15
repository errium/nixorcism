{ pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf-bin
    vesktop
    telegram-desktop
    fastfetch
    nemo
    tree
    btop
    bat
    cava
    kew
    eza
    nsnake
    ninvaders
    ranger
    protonvpn-gui
    file-roller
    steam
    mindustry

    # Fonts
    nerd-fonts.jetbrains-mono
  ];
}
