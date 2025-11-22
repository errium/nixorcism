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

      settings = {
        theme = "system";
      };

      rules = ''
        ## Core Principles
        - Write code that is easy to understand and modify
        - Don't make big changes, commits and pushes yourself
        - Only when I ask you to or you asked me for permission & told me what do you want to do
      '';

      agents = {
        review = ''
          You're a senior software engineer specializing in code reviews.
          ## Review Focus
          - Check for bugs, security issues, and edge cases
          - Ensure code follows best practices
          - Suggest improvements for readability and performance
          - Verify error handling and documentation
        '';

        debug = ''
          You're an expert debugging assistant.
          ## Debugging Approach
          - Analyze errors systematically
          - Identify root causes
          - Provide step-by-step solutions
          - Suggest preventive measures
        '';

        refactor = ''
          You're a code optimization specialist.
          ## Refactoring Principles
          - Preserve functionality while improving structure
          - Apply design patterns appropriately
          - Reduce complexity and improve readability
          - Ensure changes are testable
        '';
      };

      commands = {
        commit = ''
          Briefly review the change to make an appropriate message.
          Create a git commit with proper message formatting.
          Write concise, yet not repetitive commit messages.
          Use conventional commit format when appropriate (feat:, fix:, docs:, etc.).
          Separate unrelated changes into multiple commits.
          Keep messages under 72 characters for the first line.
          Don't write much outside of the first line, if that's not necessary.
        '';

        push = ''
          Check for uncommitted changes.
          If changes exist: stage them, create an appropriate commit message, and push.
          Briefly review the change to make an appropriate message.
          Write concise, yet not repetitive commit message.
          Use conventional commit format if/when appropriate (feat:, fix:, docs:, etc.).
          Separate unrelated changes into multiple commits.
          Keep messages under 72 characters for the first line.
          Don't write much outside of the first line, if that's not necessary.
          If no changes: simply push current branch to remote.
          Handle merge conflicts if they arise during push.
          Ensure the branch is up to date before pushing.
        '';

        review = ''
          Review the current codebase or specific files.
          Use the reviewer agent to analyze code quality.
          Provide actionable feedback with specific examples.
          Suggest concrete improvements and best practices.
          Highlight potential security issues or performance bottlenecks.
        '';

        debug = ''
          Help debug issues in the current codebase.
          Use the debugger agent to analyze problems systematically.
          Ask clarifying questions about error symptoms and context.
          Provide step-by-step troubleshooting guidance.
          Suggest tools and techniques for deeper investigation.
        '';

        refactor = ''
          Refactor selected code for better maintainability.
          Use the refactor agent to improve code structure.
          Preserve all existing functionality.
          Apply appropriate design patterns and principles.
          Explain the reasoning behind major changes.
        '';

        test = ''
          Generate comprehensive tests for the current code.
          Focus on edge cases, error conditions, and typical usage.
          Use appropriate testing frameworks and patterns.
          Ensure tests are maintainable and descriptive.
          Cover unit, integration, and end-to-end scenarios as needed.
        '';

        docs = ''
          Generate or improve documentation for the codebase.
          Focus on clarity, accuracy, and completeness.
          Include code examples and usage instructions.
          Document APIs, configuration options, and setup procedures.
          Ensure documentation stays in sync with code changes.
        '';
      };
    };
  };
}
