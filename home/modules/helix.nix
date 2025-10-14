{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "carbon";

      editor = {
        line-number = "relative";
        rulers = [ 80 ];
        mouse = true;
        auto-save = true;
        cursorline = true;
        cursorcolumn = true;
        bufferline = "always";
      };

      editor.soft-wrap = {
        enable = true;
      };

      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor.indent-guides = {
        render = true;
      };

      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };

      editor.statusline = {
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
        mode.normal = "NORMAL";
        mode.insert = "INSERT";
        mode.select = "VISUAL";
      };

      # editor.inline-diagnostics = {
      #   cursor-line = "hint";
      #   other-lines = "error";
      # };

      keys.normal = {
        space.space = ":fmt";
        space.w = ":w";
        space.q = ":q";
        space.f = "file_picker";
        space.tab = ":buffer-next";
        space.s.tab = ":buffer-previous";
      };
    };
  };

  programs.helix.languages = {
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "markdown";
        auto-format = true;
        language-servers = [
          "marksman"
          {
            name = "mpls";
            only-features = [ "workspace-command" ];
          }
        ];
        formatter.command = "${pkgs.prettier}/bin/prettier";
        formatter.args = [
          "--parser"
          "markdown"
        ];
      }
      {
        name = "python";
        auto-format = false;
        language-servers = [
          {
            name = "ruff";
            except-features = [ "format" ];
          }
        ];
      }
    ];

    language-server.nixd = with pkgs; {
      command = "${nixd}/bin/nixd";
    };
    language-server.marksman = with pkgs; {
      command = "${marksman}/bin/marksman";
    };
    language-server.mpls = with pkgs; {
      command = "${mpls}/bin/mpls";
      args = [
        "--no-auto"
        "--enable-emoji"
        "--dark-mode"
      ];
    };
    language-server.ruff = with pkgs; {
      command = "${ruff}/bin/ruff";
    };
  };
}
