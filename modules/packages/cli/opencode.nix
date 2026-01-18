{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.opencode = {
    enable = lib.mkEnableOption "opencode";
  };

  config = lib.mkIf config.nixorcism.packages.cli.opencode.enable {
    hm.programs.opencode = {
      enable = true;

      rules = ''
        ## Core Principles
        - Write code that is easy to understand and modify.
        - Analyze how the existing code is written to write in a similar manner.
        - Don't make big changes, commits, or pushes unprompted yourself.
        - Don't assume things; ask instead.
        - If something needs to be done, you will be prompted. Don't do anything outside of that.
        - Always ask for confirmation on any actions you want to take, regardless of agent settings.
      '';

      commands = {
        push = ''
          - Check for uncommitted changes.
          - If changes exist: stage them, create an appropriate commit message, and push.
          - Briefly review the change to make an appropriate message.
          - Write concise, yet not repetitive commit messages.
          - Analyze previous commit messages to see how they are written and try to write in similar way.
          - Use conventional commit format if/when appropriate (feat:, fix:, docs:, etc.).
          - Separate unrelated changes into multiple commits.
          - Keep messages under 72 characters for the first line.
          - Don't write much outside of the first line, if that's not necessary.
          - If no changes: simply push current branch to remote.
          - Handle merge conflicts if they arise during push.
          - Handle minor remote issues if they arise during push.
          - Ensure the branch is up to date before pushing.
          - Provide me with formatted details.
        '';
      };
    };
  };
}
