{
  flake.modules.nixos.feature_distrobox = {pkgs, ...}: {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    hm.programs.distrobox = {
      enable = true;
      enableSystemdUnit = true;

      containers = {
        arch = {
          image = "archlinux:latest";
          additional_packages = "base-devel curl git wget";
        };

        esp-dev = {
          clone = "arch";
          entry = true;
          additional_packages = "curl wget git python3 python3-pip cmake ninja gcc base-devel libxml2 libusb pkg-config";
          init_hooks = [
            "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
            ". $HOME/.cargo/env && cargo install espup && espup install"
          ];
        };
      };
    };

    hm.home.packages = with pkgs; [distrobox-tui];
  };
}
