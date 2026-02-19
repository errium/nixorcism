{lib, ...}: {
  imports = [
    ./gdm.nix
    ./ly.nix
    ./sddm.nix
  ];

  options.nixorcism.desktop = {
    display-manager = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum ["gdm" "ly" "sddm"]);
      default = null;
      description = "Display manager to use";
    };
  };
}
