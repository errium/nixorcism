{
  flake.modules.nixos.desktop-tool_common-packages = {pkgs, ...}: {
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
