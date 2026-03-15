{
  flake.modules.nixos.editor_zed = {
    hm.programs.zed-editor.userSettings = {
      # General
      autosave = "on_focus_change";
      base_keymap = "VSCode";
      helix_mode = true;
      restore_on_startup = "launchpad";
      when_closing_with_no_tabs = "keep_window_open";
      close_on_file_delete = true;
      restore_on_file_reopen = false;

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      # Editor
      cursor_blink = false;
      horizontal_scroll_margin = 5;
      lsp_document_colors = "background"; # color-highlight
      relative_line_numbers = "enabled";
      show_whitespaces = "none";
      soft_wrap = "editor_width";
      vertical_scroll_margin = 10;
      wrap_guides = [120];

      inlay_hints = {
        enabled = true;
        show_background = true;
      };

      # UI
      diagnostics.inline.enabled = true;
      file_finder.modal_max_width = "large";
      gutter.min_line_number_digits = 0;
      icon_theme = "Warm Charmed Icons"; # charmed-icons
      scrollbar.show = "never";
      search.button = false;
      terminal.button = false;
      toolbar.quick_actions = false;

      tab_bar = {
        show_nav_history_buttons = false;
        show_tab_bar_buttons = false;
      };

      title_bar = {
        show_project_items = false;
        show_branch_name = false;
        show_onboarding_banner = false;
        show_sign_in = false;
        show_user_menu = false;
        show_user_picture = false;
      };

      # Panels
      agent.default_width = 400;
      collaboration_panel.button = false;
      git_panel.dock = "right";
      notification_panel.button = false;

      outline_panel = {
        dock = "right";
        default_width = 300;
        scrollbar.show = "never";
      };

      project_panel = {
        auto_fold_dirs = false;
        default_width = 300;
        dock = "right";
        hide_root = true;
        scrollbar.show = "never";
        starts_open = false;
      };
    };
  };
}
