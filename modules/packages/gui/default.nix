{pkgs, ...}: {
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
}
