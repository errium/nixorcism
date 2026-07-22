{inputs, ...}: {
  flake.modules.nixos.system'theming = {
    config,
    lib,
    pkgs,
    ...
  }: let
    registry = import ./_registry.nix {inherit config;};
    active = lib.filterAttrs (_: v: v.enable) registry;
  in {
    imports = [inputs.matugen.nixosModules.default];

    programs.matugen = {
      enable = true;
      package = pkgs.matugen;
      type = "scheme-tonal-spot";
      variant = "dark";

      templates =
        lib.mapAttrs (_: v: {
          input_path = v.input;
          output_path = "~/${v.output}";
        })
        active;
    };

    hj.xdg.config.files = lib.mapAttrs' (name: v:
      lib.nameValuePair (lib.removePrefix ".config/" v.output) {
        source = "${config.programs.matugen.theme.files}/${v.output}";
      })
    active;
  };
}
