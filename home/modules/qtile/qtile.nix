{ config, pkgs, ... }:

{
  imports = [
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    xwallpaper
    networkmanagerapplet
    scrot
    xclip
  ];

  services.picom.enable = true;
  services.dunst.enable = true;

  home.file.".config/qtile/config.py".source =
    config.lib.file.mkOutOfStoreSymlink /home/errium/.dotfiles/home/modules/qtile/config.py;

  home.file.".config/qtile/colors.py".source =
    config.lib.file.mkOutOfStoreSymlink /home/errium/.dotfiles/home/modules/qtile/colors.py;
}
