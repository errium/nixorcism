{
  flake.modules.nixos.editor_vscode = {pkgs, ...}: {
    hm.programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          gruntfuggly.todo-tree
          leonardssh.vscord
          usernamehw.errorlens

          # Go
          # golang.go

          # Nix
          jnoortheen.nix-ide

          # Rust
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          vadimcn.vscode-lldb
        ];
      };
    };
  };
}
