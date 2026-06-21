{
  flake.modules.nixos.base = {config, ...}: {
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = [
          "flakes"
          "nix-command"
          "pipe-operators"
        ];
        trusted-users = ["root" "@wheel"];
      };

      gc = {
        automatic = !config.hm.programs.nh.clean.enable;
        dates = "daily";
        options = "--delete-older-than 2d";
      };

      optimise = {
        automatic = true;
        dates = "daily";
      };
    };

    # TODO: Idfk, do something about it
    nixpkgs.config.permittedInsecurePackages = [
      "electron-39.8.10"
    ];

    nixpkgs.config.allowUnfree = true;

    documentation.nixos.enable = false;
  };
}
