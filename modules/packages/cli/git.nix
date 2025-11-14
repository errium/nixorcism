{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    git.enable = lib.mkEnableOption "Enables git";
  };

  config = lib.mkIf config.nixorcism.packages.cli.git.enable {
    programs.git.enable = true;

    hm.programs.git = {
      enable = true;
      settings = {
        user.name = "Errium";
        user.email = "30936741-Errium@users.noreply.gitlab.com";
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };

      includes = [
        {
          condition = "gitlab.com:*";
          contents.user.email = "30936741-Errium@users.noreply.gitlab.com";
        }
        {
          condition = "github.com:*";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
      ];
    };
  };
}
