{
  flake.modules.nixos.wm-utils_common = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      brightnessctl
      cliphist
      playerctl
      swaybg
      wl-clip-persist
      wl-clipboard
    ];
  };
}
