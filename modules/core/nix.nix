{config, ...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel"];
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

  nixpkgs.config.allowUnfree = true;

  documentation.nixos.enable = false;
}
