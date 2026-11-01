{
  flake.modules.nixos.system'theming = {
    programs.matugen.templates = {
      foot = {
        input_path = ./templates/foot.ini;
        output_path = "~/.config/foot/matugen.ini";
      };

      gnome-shell = {
        input_path = "~/.config/matugen/templates/gnome-shell.css";
        output_path = "~/.themes/Material-Gnome/gnome-shell/gnome-shell.css";
        post_hook = ''
          dconf write /org/gnome/shell/extensions/user-theme/name "'default'" &&
          dconf write /org/gnome/shell/extensions/user-theme/name "'Material-Gnome'"
        '';
      };

      gtk3 = {
        input_path = ./templates/gtk.css;
        output_path = "~/.config/gtk-3.0/colors.css";
        post_hook = ''
          gsettings set org.gnome.desktop.interface gtk-theme "";
          gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-{{mode}}
        '';
      };

      gtk4 = {
        input_path = ./templates/gtk.css;
        output_path = "~/.config/gtk-4.0/colors.css";
        post_hook = ''
          current=$(gsettings get org.gnome.desktop.interface color-scheme)

          if [[ "$current" == "'prefer-dark'" ]]; then
            gsettings set org.gnome.desktop.interface color-scheme prefer-light
            gsettings set org.gnome.desktop.interface color-scheme prefer-dark
          else
            gsettings set org.gnome.desktop.interface color-scheme prefer-dark
            gsettings set org.gnome.desktop.interface color-scheme prefer-light
          fi
        '';
      };

      helix = {
        input_path = ./templates/helix.toml;
        output_path = "~/.config/helix/themes/matugen.toml";
      };

      qt5ct = {
        input_path = ./templates/qt.conf;
        output_path = "~/.config/qt5ct/colors/matugen.conf";
      };

      qt6ct = {
        input_path = ./templates/qt.conf;
        output_path = "~/.config/qt6ct/colors/matugen.conf";
      };

      sway = {
        input_path = ./templates/sway.conf;
        output_path = "~/.config/sway/matugen.conf";
      };
    };

    # gnome-shell
    hj.files.".themes/Material-Gnome/index.theme".text = ''
      Type=X-GNOME-Metatheme
      [Desktop Entry]
      Name=Material-Gnome
      Comment=An Flat Gtk+ theme based on Matugen color generator
      Encoding=UTF-8

      [X-GNOME-Metatheme]
      GtkTheme=Material-Gnome
      MetacityTheme=Material-Gnome
      IconTheme=Tela-circle-Dark
      CursorTheme=Tokyonight-cursors
      ButtonLayout=close,minimize,maximize:menu
    '';

    # gtk3
    hj.rum.misc.gtk.css.gtk3 = ''
      @import 'colors.css';
    '';

    # gtk4
    hj.rum.misc.gtk.css.gtk4 = ''
      @import 'colors.css';
    '';

    # qt5ct & qt6ct
    hj.xdg.config.files."qt5ct/qt5ct.conf".text = ''
      [Appearance]
      color_scheme_path=yourusername/.config/qt5ct/colors/matugen.conf
      custom_palette=true
    '';
  };
}
