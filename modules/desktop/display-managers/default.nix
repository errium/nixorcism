{lib, ...}: {
  imports = [
    ./ly.nix
    ./sddm.nix
  ];

  options.nixorcism.desktop = {
    display-manager = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum ["ly" "sddm"]);
      default = null;
      description = "Display manager to use";
    };
  };
}
