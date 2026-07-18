{
  flake.modules.nixos.cli_jujutsu = {
    hm.programs.jujutsu = {
      enable = true;
      settings = {
        user.name = "Errium";
        user.email = "197423581+Errium@users.noreply.github.com";
        git.auto-local-bookmark = true;
      };
    };
  };
}
