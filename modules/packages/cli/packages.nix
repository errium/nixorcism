{
  flake.modules.nixos.cli-packages = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      dysk
      fd
      gdu
      ripgrep
      tree
      yazi
    ];
  };
}
