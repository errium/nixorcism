{inputs, ...}: {
  flake.modules.nixos.theming = {
    config,
    lib,
    ...
  }: let
    inherit (config.nixorcism.theming) templates;
  in {
    imports = [inputs.matugen.nixosModules.default];

    programs.matugen = {
      enable = true;
      jsonFormat = "hex";
      type = "scheme-tonal-spot";
      variant = "dark";
      # wallpaper = ./wallpaper.png;
    };

    programs.matugen.templates =
      templates
      |> lib.mapAttrs (name: _: ./templates + "/${name}")
      |> lib.mapAttrs (name: input_path: {
        inherit input_path;
        output_path = ["~/${name}"];
      });

    hj.files =
      templates
      |> lib.mapAttrs' (name: target: lib.nameValuePair target "${config.programs.matugen.theme.files}/${name}")
      |> lib.mapAttrs (_: source: {inherit source;});
  };
}
