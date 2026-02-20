{pkgs, ...}: {
  flake.modules.nixos.games-packages = {
    hm.home.packages = with pkgs; [
      heroic
      mindustry
      osu-lazer-bin
    ];
  };
}
