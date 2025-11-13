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

    hm.programs.git = let
      mkGitInclude = platform: url: email: [
        {
          condition = "hasconfig:remote.*.url:https://${url}/**";
          contents.user.email = email;
        }
        {
          condition = "hasconfig:remote.*.url:git@${url}:*/**";
          contents.user.email = email;
        }
      ];

      platforms = {
        github = {
          url = "github.com";
          email = "197423581+Errium@users.noreply.github.com";
        };
        gitlab = {
          url = "gitlab.com";
          email = "30936741-Errium@users.noreply.gitlab.com";
        };
      };
    in {
      enable = true;

      settings = {
        user.name = "Errium";
        user.email = platforms.gitlab.email;
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };

      includes = lib.flatten (
        lib.mapAttrsToList (
          name: cfg:
            mkGitInclude name cfg.url cfg.email
        )
        platforms
      );
    };
  };
}
