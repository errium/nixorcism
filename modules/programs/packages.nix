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

  flake.modules.nixos.gaming_packages = {
    inputs,
    pkgs,
    ...
  }: let
    freesm = inputs.freesm.packages.${pkgs.system}.freesmlauncher;
  in {
    hm.home.packages = with pkgs; [
      freesm
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
