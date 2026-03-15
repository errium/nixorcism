{
  flake.modules.nixos.editor_zed = {
    hm.programs.zed-editor.userSettings = {
      autosave = "on_focus_change";
      base_keymap = "VSCode";
      helix_mode = true;
      when_closing_with_no_tabs = "keep_window_open";
      close_on_file_delete = true;
      restore_on_file_reopen = false;
      restore_on_startup = "launchpad";

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      cursor_blink = false;
      show_whitespaces = "none";
      horizontal_scroll_margin = 5;
      vertical_scroll_margin = 10;

      tab_bar.show = false;
      toolbar.quick_actions = false;
      file_finder.modal_max_width = "large";
      # status_bar."experimental.show" = false;
      scrollbar.show = "never";
      gutter.min_line_number_digits = 0;

      title_bar = {
        show_onboarding_banner = false;
        show_project_items = false;
        show_branch_name = false;
        show_sign_in = false;
        show_user_menu = false;
        show_user_picture = false;
      };

      project_panel = {
        dock = "right";
        default_width = 300;
        hide_root = true;
        auto_fold_dirs = false;
        starts_open = false;
        scrollbar.show = "never";
      };

      outline_panel = {
        default_width = 300;
        scrollbar.show = "never";
      };
    };
  };
}
