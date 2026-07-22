{
  flake.modules.nixos.dudos-machine = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      # CLI & TUI
      gcc
      kew
      openjdk
      terminal-toys

      # GUI
      ayugram-desktop
      discord
      element-desktop
      eog
      feishin
      keepassxc
      monero-gui
      obs-studio
      onlyoffice-desktopeditors
      proton-vpn
      r2modman
      sushi

      # Rust
      rustup
      rustlings
    ];
  };
}
