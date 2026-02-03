{
  config,
  lib,
  ...
}: {
  imports = [
    ./keybinds.nix
    ./languages.nix
  ];

  options.nixorcism.packages.editors.helix = {
    enable = lib.mkEnableOption "Helix";
  };

  config = lib.mkIf config.nixorcism.packages.editors.helix.enable {
    hm.programs.helix = {
      enable = true;

      settings.editor = {
        auto-save = true;
        bufferline = "always";
        cursorline = true;
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        rulers = [120];
        scrolloff = 15;

        gutters.line-numbers.min-width = 2;
        inline-diagnostics.cursor-line = "warning";

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
