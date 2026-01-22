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

  nixpkgs.config.permittedInsecurePackages = [
    "librewolf-bin-146.0.1-1"
    "librewolf-bin-unwrapped-146.0.1-1"
  ];

  documentation.nixos.enable = false;
  nixpkgs.config.allowUnfree = true;
}
