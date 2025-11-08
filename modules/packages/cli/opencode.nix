{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    opencode.enable = lib.mkEnableOption "Enables opencode";
  };

  config = lib.mkIf config.nixorcism.packages.cli.opencode.enable {
    hm.programs.opencode = {
      enable = true;
      agents = {
        reviewer = ''
          You're a senior software engineer specializing in code reviews.
          Focus on code quality and mainainability.

          ## Guidlines
          - Review for potential bugs and edge cases
          - Ensure code follows best practices
          - Suggest improvements for readability and performance
        '';
      };
      commands = {
        commit = ''
          Create a git commit with proper message formatting.
          Be on point with commit messaging.
          Try to write separate commit messages for different files / things achieved.
        '';
        push = ''
          Check for changes.
          If changes are commited - push.
          If changes are uncommited - commit with concise & on-point message and push.
        '';
      };
    };
  };
}
