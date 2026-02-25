{
  flake.modules.nixos.gui_packages = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      celluloid
      file-roller
      nautilus
    ];
  };
}
