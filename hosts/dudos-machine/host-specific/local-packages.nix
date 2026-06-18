{
  flake.modules.nixos.dudos-machine = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      # CLI & TUI
      gcc
      kew
      terminal-toys

      # GUI
      ayugram-desktop
      bitwarden-desktop
      discord
      element-desktop
      eog
      feishin
      # inkscape
      monero-gui
      obs-studio
      onlyoffice-desktopeditors
      proton-vpn
      r2modman
      sushi

      # Rust
      rustlings
      rustup
    ];
  };
}
