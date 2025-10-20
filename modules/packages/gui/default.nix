# {pkgs, ...}: {
#   imports = [
#     ./alacritty.nix
#     ./librewolf.nix
#   ];
#   hm.home.packages = with pkgs; [
#     telegram-desktop
#     nemo
#     protonvpn-gui
#     file-roller
#   ];
# }
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixDots.packages.gui = {
    enable = lib.mkEnableOption "Enables /gui";
  };

  config = lib.mkIf config.nixDots.packages.gui.enable {
    imports = [
      ./alacritty.nix
      ./librewolf.nix
    ];

    hm.home.packages = with pkgs; [
      telegram-desktop
      nemo
      protonvpn-gui
      file-roller
    ];
  };
}
