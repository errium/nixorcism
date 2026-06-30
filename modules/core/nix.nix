{
  flake.modules.nixos.core = {
    lib,
    username,
    ...
  }: {
    nixpkgs.config = {
      allowUnfree = true;
    };

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

    # build-vm specific
    virtualisation.vmVariant = {
      users.users.root = {
        hashedPasswordFile = lib.mkForce null;
        password = lib.mkForce "nixos";
      };
      users.users.${username} = {
        hashedPasswordFile = lib.mkForce null;
        password = lib.mkForce "nixos";
      };
    };
  };
}
