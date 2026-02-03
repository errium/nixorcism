{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixorcism.packages.editors.helix.enable {
    hm.programs.helix.languages = {
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
}
