{ pkgs, ... }:

{
  home-manager.users.errium = {
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

          soft-wrap = {
            enable = true;
          };

          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };

          indent-guides = {
            render = true;
          };

          lsp = {
            display-messages = true;
            display-inlay-hints = true;
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

        keys.normal = {
          space = {
            space = ":fmt";
            w = ":w";
            q = ":q";
            f = "file_picker";
            tab = ":buffer-next";
            s.tab = ":buffer-previous";
          };
        };
      };

      languages = {
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
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = [
                "--parser"
                "markdown"
              ];
            };
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

        language-server = {
          nixd.command = "${pkgs.nixd}/bin/nixd";
          marksman.command = "${pkgs.marksman}/bin/marksman";
          mpls = {
            command = "${pkgs.mpls}/bin/mpls";
            args = [
              "--no-auto"
              "--enable-emoji"
              "--dark-mode"
            ];
          };
          ruff.command = "${pkgs.ruff}/bin/ruff";
        };
      };
    };
  };
}
