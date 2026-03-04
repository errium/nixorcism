{
  flake.modules.nixos.editor_helix = {pkgs, ...}: {
    hm.programs.helix = {
      languages.language = [
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
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
        }

        {
          name = "python";
          auto-format = true;
        }

        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        }

        {
          name = "yaml";
          auto-format = true;
          formatter.command = "${pkgs.prettier}/bin/prettier";
          formatter.args = ["--parser" "yaml"];
          file-types = ["yaml" "yml" {glob = "templates/*.yaml";}];
        }
      ];

      languages.language-server = {
        # Bash
        bash-language-server.command = "${pkgs.bash-language-server}/bin/bash-language-server";

        # Go
        # golangci-lint-lsp.command = "${pkgs.golangci-lint-langserver}/bin/golangci-lint-langserver";
        # gopls.command = "${pkgs.gopls}/bin/gopls";

        # Markdown
        marksman.command = "${pkgs.marksman}/bin/marksman";
        mpls = {
          command = "${pkgs.mpls}/bin/mpls";
          args = ["--no-auto" "--enable-emoji" "--dark-mode"];
        };

        # Nix
        nil.command = "${pkgs.nil}/bin/nil";
        nixd.command = "${pkgs.nixd}/bin/nixd";

        # Python
        ruff.command = "${pkgs.ruff}/bin/ruff";

        # Rust
        rust-analyzer.command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      };

      extraPackages = with pkgs; [
        # golangci-lint
      ];
    };
  };
}
