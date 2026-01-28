{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.helix = {
    enable = lib.mkEnableOption "Helix";
  };

  config = lib.mkIf config.nixorcism.packages.editors.helix.enable {
    hm.programs.helix = {
      enable = true;

      settings = {
        editor = {
          auto-save = true;
          bufferline = "always";
          line-number = "relative";
          rulers = [120];
          scrolloff = 15;
          end-of-line-diagnostics = "hint";

          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };

          gutters = {
            line-numbers.min-width = 2;
            layout = [
              "diagnostics"
              "spacer"
              "line-numbers"
              "spacer"
              "diff"
            ];
          };

          indent-guides = {
            render = true;
            character = "·";
            skip-levels = 1;
          };

          inline-diagnostics = {
            cursor-line = "warning";
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

        keys.normal = {
          space = {
            space = ":fmt";
            w = ":w";
            q = ":q";
            f = "file_picker";
            tab = ":buffer-next";
            S-tab = ":buffer-previous";
            i = ":toggle lsp.display-inlay-hints";
          };
        };
      };

      languages = {
        language = [
          {
            name = "bash";
            auto-format = true;
            formatter.command = "${pkgs.shfmt}/bin/shfmt";
          }
          {
            name = "go";
            auto-format = true;
            formatter.command = "${pkgs.gofumpt}/bin/gofumpt";
          }
          {
            name = "markdown";
            auto-format = true;
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = ["--parser" "markdown"];
            };
            language-servers = [
              "marksman"
              {
                name = "mpls";
                only-features = ["workspace-command"];
              }
            ];
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${pkgs.alejandra}/bin/alejandra";
          }
        ];

        language-server = {
          bash-language-server.command = "${pkgs.bash-language-server}/bin/bash-language-server";
          gopls.command = "${pkgs.gopls}/bin/gopls";
          marksman.command = "${pkgs.marksman}/bin/marksman";
          mpls = {
            command = "${pkgs.mpls}/bin/mpls";
            args = ["--no-auto" "--enable-emoji" "--dark-mode"];
          };
          nixd.command = "${pkgs.nixd}/bin/nixd";
        };
      };
    };
  };
}
