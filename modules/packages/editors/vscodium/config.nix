{pkgs, ...}: {
  flake.modules.nixos.vscodium = {
    hm.programs.vscode.profiles.default.userSettings = {
      # EDITOR
      "editor.formatOnSave" = true;
      "editor.rulers" = [120];
      "editor.stickyScroll.enabled" = true;
      "editor.stickyScroll.maxLineCount" = 5;
      # Autocompletion
      "editor.acceptSuggestionOnEnter" = "smart";
      "editor.suggest.insertMode" = "replace";
      "editor.suggest.preview" = true;
      # Cursor
      "editor.cursorStyle" = "line";
      "editor.cursorBlinking" = "smooth";
      # Inlay hints
      "editor.inlayHints.enabled" = "on";
      "editor.inlayHints.fontSize" = 11;
      # Rendering
      "editor.bracketPairColorization.enabled" = true;
      # Scrollbar
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.horizontalScrollbarSize" = 0;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.verticalScrollbarSize" = 0;

      # WORKBENCH
      "workbench.accounts.visible" = false;
      "workbench.editor.editorActionsLocation" = "hidden";
      "workbench.layoutControl.enabled" = false;
      "workbench.sideBar.location" = "right";
      "workbench.sideBar.visible" = false;
      "workbench.startupEditor" = "none";

      # FILES
      "files.autoSave" = "onFocusChange";
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;

      # LANGUAGES
      # Go
      "go.coverOnSingleTest" = true;
      "go.formatTool" = "gofumpt";
      "go.lintOnSave" = "package";
      "go.lintTool" = "golangci-lint";
      "go.showTestCodeLens" = true;
      "go.testFlags" = ["-v" "-count=1"];
      "go.useLanguageServer" = true;
      "go.vetOnSave" = "package";
      "gopls" = {
        "ui.completion.usePlaceholders" = true;
        "ui.diagnostic.staticcheck" = true;
        "ui.inlayhint.assignVariableTypes" = true;
        "ui.inlayhint.constantValues" = true;
        "ui.inlayhint.parameterNames" = true;
        "ui.inlayhint.rangeVariableTypes" = true;
        "ui.semanticTokens" = true;
      };
      "[go]" = {
        "editor.defaultFormatter" = "golang.go";
        "editor.formatOnSave" = true;
        "editor.insertSpaces" = false;
      };
      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = ["${pkgs.alejandra}/bin/alejandra"];
          };
        };
      };

      # MISC
      "editor.semanticHighlighting.enabled" = true;
      "telemetry.telemetryLevel" = "off";
      "terminal.integrated.scrollback" = 5000;
      "update.mode" = "none";
    };
  };
}
