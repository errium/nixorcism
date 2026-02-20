{pkgs, ...}: {
  flake.modules.nixos.host-specific = {
    hm.home.packages = with pkgs; [
      # GUI
      bitwarden-desktop
    ];
  };
}
