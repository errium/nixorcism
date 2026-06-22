{
  flake.modules.nixos.core = {
    nix.settings = {
      auto-optimise-store = true;
      experimental-features = ["flakes" "nix-command" "pipe-operators"];
      trusted-users = ["root" "@wheel"];
    };

    nix.gc = {
      # automatic = !config.hm.programs.nh.clean.enable;
      dates = "daily";
      options = "--delete-older-than 2d";
    };

    nix.optimise = {
      automatic = true;
      dates = "daily";
      persistent = true;
    };

    nixpkgs.config = {
      allowUnfree = true;
    };
  };
}
