{pkgs, ...}: {
  flake.modules.nixos.vscodium = {
    hm.programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          continue.continue
          gruntfuggly.todo-tree
          leonardssh.vscord
          usernamehw.errorlens

          # Go
          golang.go

          # Nix
          jnoortheen.nix-ide
        ];
      };
    };
  };
}
