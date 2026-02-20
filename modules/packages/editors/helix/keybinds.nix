{
  flake.modules.nixos.helix = {
    hm.programs.helix.settings.keys = {
      normal = {
        space = {
          space = ":fmt";
          w = ":w";
          q = ":q";
          f = "file_picker";
          tab = ":buffer-next";
          S-tab = ":buffer-previous";
          i = ":toggle lsp.display-inlay-hints";
        };
      };
    };
  };
}
