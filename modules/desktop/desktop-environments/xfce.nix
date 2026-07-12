{
  flake.modules.nixos.xfce = {pkgs, ...}: {
    services.xserver = {
      enable = true; # Legacy strikes again, yikes :/
      desktopManager.xfce.enable = true;
    };

    environment.xfce.excludePackages = with pkgs; [
      mousepad
      parole
      ristretto
      xfce4-taskmanager
      xfce4-terminal
    ];

    imports = [../_common.nix];
  };
}
