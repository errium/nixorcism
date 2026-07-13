{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: {
    nixpkgs.config.allowUnfree = true;

    nix.channel.enable = false;

    nix.settings = {
      auto-optimise-store = true;
      experimental-features = ["flakes" "nix-command" "pipe-operators"];
      trusted-users = ["root" "@wheel"];
    };

    nix.gc = {
      automatic = !config.programs.nh.clean.enable;
      dates = "daily";
      options = "--delete-older-than 2d";
    };

    nix.optimise = {
      automatic = true;
      dates = "daily";
      persistent = true;
    };

    # FIXME: build-vm specific
    virtualisation.vmVariant = {
      users.users.root = {
        hashedPasswordFile = lib.mkForce null;
        password = lib.mkForce "nixos";
      };

      users.users.${config.nixorcism.username} = {
        hashedPasswordFile = lib.mkForce null;
        password = lib.mkForce "nixos";
      };
    };

    # FIXME: build-vm-with-bootloader specific
    virtualisation.vmVariantWithBootLoader = {
      users.users.root = {
        hashedPasswordFile = lib.mkForce null;
        password = lib.mkForce "nixos";
      };

      users.users.${config.nixorcism.username} = {
        hashedPasswordFile = lib.mkForce null;
        password = lib.mkForce "nixos";
      };
    };
  };
}
