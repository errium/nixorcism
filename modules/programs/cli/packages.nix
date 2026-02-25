{
  flake.modules.nixos.cli_packages = {pkgs, ...}: {
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
