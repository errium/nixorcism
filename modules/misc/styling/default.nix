{lib, ...}: {
  imports = [
    ./fonts.nix
    ./stylix.nix
  ];

  options.nixorcism.misc.styling = {
    enable = lib.mkEnableOption "system styling";
  };
}
