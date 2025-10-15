{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;

    settings = {
      font_size = 12;
      font_family = "JetBrainsMono Nerd Font";
      enable_audio_bell = false;
      window_padding_width = 10;
      background_opacity = "1";
      mouse_hide_wait = 1.0;

      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "slant";
      tab_title_template = "{title}{' [ {} ]'.format(num_windows) if num_windows > 1 else ''}";
      active_tab_font_style = "bold";
      tab_bar_align = "center";
    };
  };
}
