{lib, ...}: {
  imports = [
    ./fonts.nix
    ./stylix.nix
    ./targets.nix
  ];

  options.nixorcism.misc.styling = {
    enable = lib.mkEnableOption "system styling";
  };
}
