{
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./displayManager.nix
    ./networking.nix
    ./nvidia.nix
    # ./niri.nix
    ./services.nix
    ./sh.nix
    ./sound.nix
    ./sudo.nix
    ./systemPackages.nix
    ./users.nix
    ./stylix.nix
    ./virtualization.nix
    ./xserver.nix
    ./zram.nix

    # TEST
    ./testingOXWM.nix
  ];
}
