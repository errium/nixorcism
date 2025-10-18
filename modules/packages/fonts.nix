{pkgs, ...}: {
  fonts.packages = with pkgs; [
    dejavu_fonts
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  hm = {
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
