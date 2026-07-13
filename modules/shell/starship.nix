{
  flake.modules.nixos.shell'starship = {config, ...}: {
    programs.starship = {
      enable = true;
      transientPrompt.enable = true;
    };

    hj.xdg.config.files."starship.toml".source =
      config.impureDir + "/starship/starship.toml";
  };
}
