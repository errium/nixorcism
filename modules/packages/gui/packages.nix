{pkgs, ...}: {
  flake.modules.nixos.gui-packages = {
    hm.home.packages = with pkgs; [
      celluloid
      file-roller
      nautilus
    ];
  };
}
