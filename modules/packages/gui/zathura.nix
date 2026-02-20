{
  flake.modules.nixos.zathura = {
    hm.programs.zathura = {
      enable = true;

      options = {
        recolor = true;
      };

      mappings = {
        i = "recolor";
      };
    };
  };
}
