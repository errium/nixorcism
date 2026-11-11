{
  flake.modules.nixos.theming = {
    config,
    lib,
    pkgs,
    ...
  }: let
    fontSets = {
      go = {
        sansSerif.name = "DejaVu Sans";
        sansSerif.package = pkgs.dejavu_fonts;
        serif.name = "DejaVu Serif";
        serif.package = pkgs.dejavu_fonts;
        monospace.name = "GoMono Nerd Font";
        monospace.package = pkgs.nerd-fonts.go-mono;
        emoji.name = "Noto Color Emoji";
        emoji.package = pkgs.noto-fonts-color-emoji;
      };

      ibm = {
        sansSerif.name = "IBM Plex Sans";
        sansSerif.package = pkgs.ibm-plex;
        serif.name = "IBM Plex Serif";
        serif.package = pkgs.ibm-plex;
        monospace.name = "Lilex Nerd Font";
        monospace.package = pkgs.nerd-fonts.lilex;
        emoji.name = "Noto Color Emoji";
        emoji.package = pkgs.noto-fonts-color-emoji;
      };

      jetbrains = {
        sansSerif.name = "Inter";
        sansSerif.package = pkgs.inter;
        serif.name = "Inter";
        serif.package = pkgs.inter;
        monospace.name = "JetBrainsMono Nerd Font";
        monospace.package = pkgs.nerd-fonts.jetbrains-mono;
        emoji.name = "Noto Color Emoji";
        emoji.package = pkgs.noto-fonts-color-emoji;
      };

      source = {
        sansSerif.name = "Source Sans 3";
        sansSerif.package = pkgs.source-sans;
        serif.name = "Source Serif 4";
        serif.package = pkgs.source-serif;
        monospace.name = "SauceCodePro Nerd Font";
        monospace.package = pkgs.nerd-fonts.sauce-code-pro;
        emoji.name = "Noto Color Emoji";
        emoji.package = pkgs.noto-fonts-color-emoji;
      };
    };
  in {
    nixorcism.theming.fonts =
      fontSets.jetbrains
      |> lib.mapAttrs (_: lib.mapAttrs (_: lib.mkDefault));

    fonts.packages =
      config.nixorcism.theming.fonts
      |> lib.attrValues
      |> map (font: font.package)
      |> lib.filter (package: package != null);

    fonts.fontconfig.defaultFonts =
      config.nixorcism.theming.fonts
      |> lib.mapAttrs (_: font: [font.name]);
  };
}
