{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.zed = {
    enable = lib.mkEnableOption "Zed";
  };

  config = lib.mkIf config.nixorcism.packages.editors.zed.enable {
    hm.programs.zed-editor = {
      enable = true;

      mutableUserDebug = false;
      mutableUserKeymaps = false;
      mutableUserSettings = false;
      mutableUserTasks = false;

      extensions = ["nix"];
      extraPackages = with pkgs; [
        nil
        nixd
      ];

      userSettings = {
        autosave = "on_focus_change";
        base_keymap = "VSCode";
        collaboration_panel.button = false;
        disable_ai = true;
        helix_mode = true;
        project_panel.dock = "right";
        relative_line_numbers = "enabled";
        scrollbar.show = "never";
        terminal.button = false;
        theme = lib.mkIf config.stylix.enable "Base16 untitled";
        ui_font_size = lib.mkForce 16;
        wrap_guides = [120];

        inlay_hints = {
          enabled = true;
          show_background = true;
        };

        toolbar = {
          breadcrumbs = false;
          quick_actions = false;
          selections_menu = false;
          agent_review = false;
          code_actions = false;
        };

        title_bar = {
          show_branch_icon = true;
          show_branch_name = true;
          show_menus = false;
          show_onboarding_banner = false;
          show_project_items = true;
          show_sign_in = false;
          show_user_menu = false;
          show_user_picture = false;
        };

        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        languages = {
          Go.formatter."external".command = "${pkgs.gofumpt}/bin/gofumpt";
          Nix.formatter."external".command = "${pkgs.alejandra}/bin/alejandra";
        };
      };
    };
  };
}
