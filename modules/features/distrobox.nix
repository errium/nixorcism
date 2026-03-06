{
  flake.modules.nixos.feature_distrobox = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    hm.programs.distrobox = {
      enable = true;

      containers = {
        arch = {
          image = "archlinux:latest";
          additional_packages = "base-devel curl eza fzf git ripgrep";
        };
      };
    };
  };
}
