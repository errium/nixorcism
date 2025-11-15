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
          # GitLab HTTPS
          condition = "hasconfig:remote.*.url:https://gitlab.com/**";
          contents.user.email = "30936741-Errium@users.noreply.gitlab.com";
        }
        {
          # GitLab SSH
          condition = "hasconfig:remote.*.url:git@gitlab.com:*/**";
          contents.user.email = "30936741-Errium@users.noreply.gitlab.com";
        }
        {
          # GitHub HTTPS
          condition = "hasconfig:remote.*.url:https://github.com/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
        {
          # GitHub SSH
          condition = "hasconfig:remote.*.url:git@github.com:*/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
        {
          # GitHub Gist HTTPS
          condition = "hasconfig:remote.*.url:https://gist.github.com/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
        {
          # GitHub Gist SSH
          condition = "hasconfig:remote.*.url:git@gist.github.com:*/**";
          contents.user.email = "197423581+Errium@users.noreply.github.com";
        }
      ];
    };
  };
}
