{
  flake.modules.nixos.editor_helix = {
    hm.programs.helix = {
      enable = true;

      settings.editor = {
        auto-format = true;
        auto-save = true;
        bufferline = "always";
        cursorline = true;
        end-of-line-diagnostics = "hint";
        gutters.line-numbers.min-width = 2;
        # inline-diagnostics.cursor-line = "warning";
        line-number = "relative";
        rulers = [120];
        scrolloff = 15;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        indent-guides = {
          render = true;
          character = "·";
          skip-levels = 1;
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        soft-wrap = {
          enable = true;
          wrap-indicator = "↩ ";
        };

        statusline = {
          left = [
            "mode"
            "spinner"
            "diagnostics"
          ];
          center = [
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          right = [
            "position"
            "separator"
            "total-line-numbers"
          ];
          separator = "|";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "VISUAL";
          };
        };
      };
    };
  };
}
