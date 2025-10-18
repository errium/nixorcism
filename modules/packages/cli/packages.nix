{pkgs, ...}: {
  hm = {
    home.packages = with pkgs; [
      tree
    ];
  };
}
