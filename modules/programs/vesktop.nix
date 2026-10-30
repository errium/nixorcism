{
  flake.modules.nixos.programs'vesktop = {
    config,
    pkgs,
    ...
  }: {
    hj.packages = with pkgs; [vesktop];

    hj.xdg.config.files = {
      "vesktop/settings.json".source = config.impureDir + "/vesktop/vesktop-settings.json";
      "vesktop/settings/settings.json".source = config.impureDir + "/vesktop/vencord-settings.json";
    };

    nixorcism.preserve.user.directories = [".config/vesktop/"];
  };
}
