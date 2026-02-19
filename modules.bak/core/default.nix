{lib, ...}: {
  imports = [
    ./grub.nix
    ./limine.nix
    ./locale-time.nix
    ./networking.nix
    ./nix.nix
    ./sudo.nix
    ./user-dirs.nix
    ./user.nix
    ./zram.nix
  ];

  options.nixorcism.core = {
    bootloader = lib.mkOption {
      type = lib.types.enum ["grub" "limine"];
      default = "grub";
      description = "Which bootloader to use";
    };
  };
}
