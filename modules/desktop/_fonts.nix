# NOTE: Questionable move, but this file is imported
# via _common.nix instead of mkImport (hence no fp module here).
# It's a bit tangled, but it works and creates less noise overall.
{pkgs, ...}: let
  active = fontSets.go;

  fontSets = {
    go = {
      sansSerif.name = "DejaVu Sans";
      sansSerif.package = pkgs.dejavu_fonts;
      serif.name = "DejaVu Serif";
      serif.package = pkgs.dejavu_fonts;
      monospace.name = "GoMono Nerd Font";
      monospace.package = pkgs.nerd-fonts.go-mono;
    };

    ibm = {
      sansSerif.name = "IBM Plex Sans";
      sansSerif.package = pkgs.ibm-plex;
      serif.name = "IBM Plex Serif";
      serif.package = pkgs.ibm-plex;
      monospace.name = "Lilex Nerd Font";
      monospace.package = pkgs.nerd-fonts.lilex;
    };

    jetbrains = {
      sansSerif.name = "Inter";
      sansSerif.package = pkgs.inter;
      serif.name = "Inter";
      serif.package = pkgs.inter;
      monospace.name = "JetBrainsMono Nerd Font";
      monospace.package = pkgs.nerd-fonts.jetbrains-mono;
    };

    source = {
      sansSerif.name = "Source Sans 3";
      sansSerif.package = pkgs.source-sans;
      serif.name = "Source Serif 4";
      serif.package = pkgs.source-serif;
      monospace.name = "SauceCodePro Nerd Font";
      monospace.package = pkgs.nerd-fonts.sauce-code-pro;
    };
  };
in {
  fonts.enableDefaultPackages = true;

  fonts.packages = with active; [
    sansSerif.package
    serif.package
    monospace.package
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [active.sansSerif.name];
    serif = [active.serif.name];
    monospace = [active.monospace.name];
    emoji = ["Noto Color Emoji"];
  };
}
