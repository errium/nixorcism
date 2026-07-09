{inputs, ...}: {
  flake.modules.nixos.core = {config, ...}: let
    username = config.nixorcism.username;
    confDir = config.nixorcism.confDir;
  in {
    imports = [inputs.hjem.nixosModules.default];
    hjem.extraModules = [inputs.hjem-impure.hjemModules.default];

    hjem.users.${username} = {
      enable = true;

      impure = {
        enable = true;
        dotsDir = "${../../impure}";
        dotsDirImpure = confDir + "/impure";
      };

      # TEST
      xdg.config.files = let
        impureDir = config.hjem.users.${username}.impure.dotsDir;
      in {
        "helix/config.toml".source = impureDir + "/helix/config.toml";
      };
    };
  };
}
