{pkgs, ...}: {
  hm = {
    programs.alacritty = {
      enable = true;

      theme = "oxocarbon";

      settings = {
        font.normal.family = "${pkgs.nerd-fonts.jetbrains-mono}";
      };
    };
  };
}
