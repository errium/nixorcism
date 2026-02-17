{
  config,
  lib,
  ...
}: let
  stx = config.lib.stylix.colors.withHashtag;
  accent = stx.base0D;
  accentedBackground = "${accent}11";
in {
  config = lib.mkIf (config.nixorcism.packages.editors.vscodium.enable && config.stylix.enable) {
    hm.programs.vscode.profiles.default.userSettings."workbench.colorCustomizations"."[Stylix]" = {
      # Global
      "button.background" = "${accent}";
      "button.foreground" = "${stx.base00}";
      "focusBorder" = "${accent}";
      "widget.border" = "${stx.base01}";

      # Title bar
      "titleBar.activeBackground" = "${stx.base00}";
      "titleBar.activeForeground" = "${stx.base05}";
      "titleBar.inactiveBackground" = "${stx.base00}";
      "titleBar.inactiveForeground" = "${stx.base03}";

      # Tab bar
      "editorGroupHeader.tabsBackground" = "${stx.base00}";
      "tab.activeBackground" = "${accentedBackground}";
      "tab.activeBorderTop" = "${accent}";
      "tab.activeForeground" = "${stx.base05}";
      "tab.inactiveBackground" = "${stx.base00}";
      "tab.inactiveForeground" = "${stx.base03}";

      # Breadcrumb
      "breadcrumb.activeSelectionForeground" = "${accent}";
      "breadcrumb.background" = "${stx.base00}";
      "breadcrumb.focusForeground" = "${accent}";
      "breadcrumb.foreground" = "${stx.base03}";

      # Activity bar
      "activityBar.activeBackground" = "${accentedBackground}";
      "activityBar.activeBorder" = "${accent}";
      "activityBar.background" = "${stx.base00}";
      "activityBar.foreground" = "${accent}";
      "activityBar.inactiveForeground" = "${stx.base04}";
      "activityBarBadge.background" = "${accent}";

      # Side bar
      "list.activeSelectionBackground" = "${stx.base01}";
      "list.focusAndSelectionOutline" = "${accent}";
      "list.focusOutline" = "${accent}";
      "list.hoverBackground" = "${stx.base01}";
      "sideBar.background" = "${stx.base00}";
      "sideBar.border" = "${stx.base01}";
      "sideBarSectionHeader.background" = "${stx.base00}";

      # Notifications
      "notifications.background" = "${stx.base01}";
      "notifications.foreground" = "${stx.base05}";

      # Panel
      "panel.background" = "${stx.base00}";
      "panel.border" = "${stx.base01}";
      "panelTitle.activeBorder" = "${accent}";
      "panelTitle.activeForeground" = "${stx.base05}";
      "panelTitle.inactiveForeground" = "${stx.base03}";

      # Status bar
      "statusBar.background" = "${stx.base01}";
      "statusBar.foreground" = "${stx.base05}";
      "statusBar.focusBorder" = "${stx.base01}";
      "statusBar.noFolderBackground" = "${stx.base01}";
      "statusBar.noFolderForeground" = "${stx.base05}";
    };
  };
}
