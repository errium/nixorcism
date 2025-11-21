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
          condition = "hasconfig:remote.*.url:https://gitlab.com/**";
          contents.user.email = "30936741-Errium@users.noreply.gitlab.com";
        }
        {
          condition = "hasconfig:remote.*.url:git@gitlab.com:*/**";
          contents.user.email = "30936741-Errium@users.noreply.gitlab.com";
        }
        {
          condition = "hasconfig:remote.*.url:https://github.com/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
        {
          condition = "hasconfig:remote.*.url:git@github.com:*/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
        {
          condition = "hasconfig:remote.*.url:https://gist.github.com/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
        {
          condition = "hasconfig:remote.*.url:git@gist.github.com:*/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
      ];
    };
  };
}
