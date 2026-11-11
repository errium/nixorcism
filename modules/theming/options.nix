{
  # NOTE: This is needed so the options always exist,
  # whether or not the theming module is imported on a host.
  flake.modules.nixos.theming'options = {lib, ...}: let
    inherit (lib) mkOption;
    inherit (lib.types) attrsOf nullOr package str submodule;

    fontType = submodule {
      options = {
        name = mkOption {type = str;};
        package = mkOption {
          type = nullOr package;
          default = null;
        };
      };
    };

    font = generic:
      mkOption {
        type = fontType;
        default.name = generic;
        description = "Font for the ${generic} role.";
      };
  in {
    options.nixorcism.theming = {
      fonts = {
        sansSerif = font "sans-serif";
        serif = font "serif";
        monospace = font "monospace";
        emoji = font "emoji";
      };

      templates = lib.mkOption {
        type = attrsOf str;
        default = {};
        description = "Template file in ./templates -> target path relative to $HOME.";
      };
    };
  };
}
