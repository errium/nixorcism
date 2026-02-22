{
  flake.modules.nixos.games_packages = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      heroic
      mindustry
      osu-lazer-bin
    ];
  };
}
