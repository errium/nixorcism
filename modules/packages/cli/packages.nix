{pkgs, ...}: {
  hm = {
    home.packages = with pkgs; [
      tree
      bat
      eza
      kew
      nsnake
      ninvaders
      ranger
    ];
  };
}
