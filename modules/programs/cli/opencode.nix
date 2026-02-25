{
  flake.modules.nixos.cli_opencode = {
    hm.programs.opencode = {
      enable = true;

      rules = ''
        ## Core Behavior
        - **ALWAYS ask before taking actions** - no modifications, commits, or pushes without confirmation
        - Be direct and concise
        - **Format responses properly** - use headers, lists, code blocks. NO unformatted walls of text

        ## Code Principles
        - Match existing code style and patterns before changing anything
        - Simple over clever - readability > "smartness"
        - Explicit over implicit
        - Keep changes minimal - no unprompted refactoring
        - When uncertain - ASK, don't assume

        ## Response Format
        Use markdown properly:
        - Headers (##) for sections
        - Code blocks with language tags
        - Lists for steps/options
        - **Bold** for key points
        - Line breaks between sections
      '';

      commands = {
        push = ''
          1. Check git status and current branch
          2. If uncommitted changes:
             - Stage changes
             - Analyze what changed
             - Review previous commits to match style
             - Create commit message:
               * Conventional commits when appropriate (feat:, fix:, docs:)
               * First line <72 chars, specific but concise
               * Split unrelated changes into multiple commits
          3. Sync with remote (fetch, pull if behind, handle conflicts)
          4. Push to origin
          5. Report: branch, commit message, files changed, status

          **Commit examples:**
          Good: "feat: add auth module", "fix: race condition in cache"
          Bad: "update", "changes", walls of text in first line
        '';
      };
    };
  };
}
