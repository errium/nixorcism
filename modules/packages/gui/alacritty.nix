{pkgs, ...}: {
  hm = {
    programs.alacritty = {
      enable = true;

      theme = "oxocarbon";

      settings = {
        font.normal.family = "JetBrainsMono Nerd Font";
      };
    };

    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
