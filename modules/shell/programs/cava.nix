{
  flake.modules.nixos.programs'cava = {
    hm.programs.cava = {
      enable = true;
      settings = {
        general.bar_width = 1;
        output.channels = "mono";
        # output.xaxis = "frequency";
      };
    };
  };
}
