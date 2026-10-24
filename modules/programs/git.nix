{
  flake.modules.nixos.programs'git = {
    programs.git.enable = true;

    hj.rum.programs.git = {
      enable = true;
      settings = {
        user.name = "Errium";
        user.email = "197423581+Errium@users.noreply.github.com";
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };
  };
}
