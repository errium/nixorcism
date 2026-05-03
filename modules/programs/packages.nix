{
  flake.modules.nixos.cli_packages = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      dysk
      fd
      gdu
      ripgrep
      tree
      yazi
    ];
  };

  flake.modules.nixos.gaming_packages = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      heroic
      mindustry
      osu-lazer-bin
    ];
  };

  flake.modules.nixos.gui_packages = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      celluloid
      file-roller
      nautilus
    ];
  };
}
