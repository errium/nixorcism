{
  flake.modules.nixos.virtual-nix = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      # GUI
      bitwarden-desktop
    ];
  };
}
