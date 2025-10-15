{
  stylix.enable = true;
  stylix.polarity = "dark";

  stylix.targets.grub.enable = false;

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";

  # Oxocarbon (normalized)
  stylix.base16Scheme = {
    base00 = "#161616"; # Background
    base01 = "#262626"; # Lighter background
    base02 = "#393939"; # Selection background
    base03 = "#525252"; # Dark text / comment text
    base04 = "#dde1e6"; # Lighter text
    base05 = "#f2f4f8"; # Main text
    base06 = "#ffffff"; # Highlighted text
    base07 = "#82cfff"; # Light cyan           (prev. base0F)
    base08 = "#ee5396"; # Red                  (prev. base0A)
    base09 = "#78a9ff"; # Blue accent          (prev. base0D)
    base0A = "#ff7eb6"; # Light red/pink       (prev. base0C)
    base0B = "#42be65"; # Green                (prev. base0D)
    base0C = "#08bdba"; # Cyan                 (prev. base07)
    base0D = "#33b1ff"; # Blue                 (prev. base0B)
    base0E = "#be95ff"; # Purple               (prev. base0E)
    base0F = "#3ddbd9"; # Teal/greenish        (prev. base08)
  };
}
