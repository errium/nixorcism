{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixorcism.packages.editors.helix.enable {
    hm.programs.helix = {
      languages = {
        language = [
          {
            name = "bash";
            formatter.command = "${pkgs.shfmt}/bin/shfmt";
          }
          {
            name = "go";
            formatter.command = "${pkgs.gofumpt}/bin/gofumpt";
          }
          {
            name = "markdown";
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
            formatter.command = "${pkgs.alejandra}/bin/alejandra";
          }
          {
            name = "yaml";
            formatter = {
              command = "${pkgs.prettier}/bin/prettier";
              args = ["--parser" "yaml"];
            };
          }
        ];

        language-server = {
          bash-language-server.command = "${pkgs.bash-language-server}/bin/bash-language-server";
          golangci-lint-lsp.command = "${pkgs.golangci-lint-langserver}/bin/golangci-lint-langserver";
          gopls.command = "${pkgs.gopls}/bin/gopls";
          marksman.command = "${pkgs.marksman}/bin/marksman";
          mpls = {
            command = "${pkgs.mpls}/bin/mpls";
            args = ["--no-auto" "--enable-emoji" "--dark-mode"];
          };
          nil.command = "${pkgs.nil}/bin/nil";
          nixd.command = "${pkgs.nixd}/bin/nixd";
        };
      };

      extraPackages = with pkgs; [
        delve
        golangci-lint
      ];
    };
  };
}
