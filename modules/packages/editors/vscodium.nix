{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.vscodium = {
    enable = lib.mkEnableOption "VSCodium";
  };

  config = lib.mkIf config.nixorcism.packages.editors.vscodium.enable {
    hm.programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        userSettings = {
          "editor.formatOnSave" = true;
          "editor.inlayHints.enabled" = "on";
          "editor.inlayHints.fontSize" = 11;
          "editor.lineNumbers" = "relative";
          "editor.minimap.enabled" = false;
          "editor.rulers" = [120];
          "editor.scrollbar.horizontal" = "hidden";
          "editor.scrollbar.horizontalScrollbarSize" = 0;
          "editor.scrollbar.vertical" = "hidden";
          "editor.scrollbar.verticalScrollbarSize" = 0;
          "editor.stickyScroll.enabled" = true;
          "editor.stickyScroll.maxLineCount" = 5;

          "workbench.accounts.visible" = false;
          "workbench.sideBar.location" = "right";
          "workbench.sideBar.visible" = false;
          "workbench.startupEditor" = "none";
        };

        extensions = with pkgs.vscode-extensions; [
          # Utils
          eamodio.gitlens
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
