{
  flake.modules.nixos.editor_helix = {pkgs, ...}: {
    hm.programs.helix = {
      languages = {
        language = [
          {
            name = "bash";
            auto-format = true;
            formatter.command = "${pkgs.shfmt}/bin/shfmt";
          }
          # {
          #   name = "go";
          #   auto-format = true;
          #   formatter.command = "${pkgs.gofumpt}/bin/gofumpt";
          # }
          {
            name = "nix";
            auto-format = true;
            formatter.command = "${pkgs.alejandra}/bin/alejandra";
          }
          {
            name = "rust";
            auto-format = true;
            formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
          }
          {
            name = "markdown";
            auto-format = true;
            formatter.command = "${pkgs.prettier}/bin/prettier";
            formatter.args = ["--parser" "markdown"];
            language-servers = [
              "marksman"
              {
                name = "mpls";
                only-features = ["workspace-command"];
              }
            ];
          }
          {
            name = "yaml";
            auto-format = true;
            formatter.command = "${pkgs.prettier}/bin/prettier";
            formatter.args = ["--parser" "yaml"];
            file-types = ["yaml" "yml" {glob = "templates/*.yaml";}];
          }
        ];

        language-server = {
          bash-language-server.command = "${pkgs.bash-language-server}/bin/bash-language-server";
          # golangci-lint-lsp.command = "${pkgs.golangci-lint-langserver}/bin/golangci-lint-langserver";
          # gopls.command = "${pkgs.gopls}/bin/gopls";
          marksman.command = "${pkgs.marksman}/bin/marksman";
          nil.command = "${pkgs.nil}/bin/nil";
          nixd.command = "${pkgs.nixd}/bin/nixd";
          rust-analyzer.command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          mpls = {
            command = "${pkgs.mpls}/bin/mpls";
            args = ["--no-auto" "--enable-emoji" "--dark-mode"];
          };
        };
      };

      extraPackages = with pkgs; [
        # golangci-lint
      ];
    };
  };
}
