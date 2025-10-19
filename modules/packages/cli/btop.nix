{pkgs, ...}: {
  hm.programs.btop = {
    enable = true;
    package = pkgs.btop-cuda;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      rounded_corners = false;
    };
  };
}
