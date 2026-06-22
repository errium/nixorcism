{
  flake.modules.nixos.virtual-nix = {pkgs, ...}: {
    imports = [./_hardware.nix];
    system.stateVersion = "25.11";

    nixorcism.bootloader = "systemd-boot";

    boot.kernelPackages = pkgs.linuxPackages_latest;
    # users.defaultUserShell = pkgs.fish;
  };
}
