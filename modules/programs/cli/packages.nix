{ pkgs, ... }:

{
  home-manager.users.errium = {
    home.packages = with pkgs; [
      tree
    ];
  };
}
