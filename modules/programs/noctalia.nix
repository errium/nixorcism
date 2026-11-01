{
  flake.modules.nixos.programs'noctalia = {
    programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
      systemd.enable = true;
    };

    nixorcism.preserve.user.directories = [
      ".cache/noctalia"
      ".config/noctalia"
      ".local/state/noctalia"
    ];
  };
}
