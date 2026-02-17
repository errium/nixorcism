{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./config.nix];

  options.nixorcism.packages.editors.vscodium = {
    enable = lib.mkEnableOption "VSCodium";
  };

  config = lib.mkIf config.nixorcism.packages.editors.vscodium.enable {
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
        ];
      };
    };
  };
}
