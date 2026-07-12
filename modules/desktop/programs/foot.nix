{
  flake.modules.nixos.program'foot = {config, ...}: {
    programs.foot = {
      enable = true;
      xdg.serverAutostart = true;
    };

    hj.xdg.config.files."foot/foot.ini".source =
      config.impureDir + "/foot/foot.ini";
  };
}
