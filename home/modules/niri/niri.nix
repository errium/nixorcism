{ config, pkgs, ... }:

{
  imports = [
    ./noctalia.nix
    ./rofi/rofi.nix
  ];

  home.packages = with pkgs; [
    swaybg
    brightnessctl
    playerctl
  ];

  home.file.".config/niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink /home/errium/.dotfiles/home/modules/niri/config.kdl;
}
