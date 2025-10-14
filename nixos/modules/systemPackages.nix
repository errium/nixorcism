{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    pulseaudio

    brightnessctl
    libnotify

    vim
    git
    kitty
    wget
  ];

  fonts.packages = with pkgs; [
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
