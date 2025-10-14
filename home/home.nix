{
  home.username = "errium";
  home.homeDirectory = "/home/errium";
  home.stateVersion = "25.11";

  imports = [
    ./homePackages.nix
    ./modules
  ];
}
