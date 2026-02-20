{pkgs, ...}: {
  hm.home.packages = with pkgs; [
    # GUI
    bitwarden-desktop

    # Go
    gcc
    go
  ];
}
