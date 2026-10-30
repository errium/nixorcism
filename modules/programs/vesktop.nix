{
  flake.modules.nixos.programs'vesktop = {
    config,
    pkgs,
    ...
  }: {
    hj.packages = with pkgs; [vesktop];

    hj.xdg.config.files."vesktop/settings/settings.json".source = config.impureDir + "/vesktop/settings.json";

    nixorcism.preserve.user.directories = [".config/vesktop/"];
  };
}
