{
  flake.modules.nixos.shell'starship = {config, ...}: {
    hj.rum.programs.starship = {
      enable = true;
      transience.enable = true;

      integrations = {
        fish.enable = config.hj.rum.programs.fish.enable;
        nushell.enable = config.hj.rum.programs.nushell.enable;
        zsh.enable = config.hj.rum.programs.zsh.enable;
      };
    };

    hj.xdg.config.files."starship.toml".source =
      config.impureDir + "/starship/starship.toml";
  };
}
