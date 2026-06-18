{
  flake.modules.nixos.editor_helix = {pkgs, ...}: {
    hm.programs.helix = {
      languages.language = [
        {
          name = "bash";
          auto-format = true;
          formatter.command = "${pkgs.shfmt}/bin/shfmt";
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

        {
          name = "toml";
          auto-format = true;
        }
      ];

      languages.language-server = {
        # Bash
        bash-language-server.command = "${pkgs.bash-language-server}/bin/bash-language-server";

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

        # Toml
        taplo.command = "${pkgs.taplo}/bin/taplo";
      };
    };
  };
}
