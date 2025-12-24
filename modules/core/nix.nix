{config, ...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = !config.nixorcism.packages.cli.nh.enable;
      dates = "daily";
      options = "--delete-older-than 2d";
    };

    optimise = {
      automatic = true;
      dates = "daily";
    };
  };

  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;
}
