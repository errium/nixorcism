{inputs, ...}: {
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    username = config.nixorcism.username;
    confDir = config.nixorcism.confDir;
  in {
    imports = [
      inputs.hjem.nixosModules.default
      (lib.mkAliasOptionModule ["hj"] ["hjem" "users" username])
      (lib.mkAliasOptionModule ["impureDir"] ["hjem" "users" username "impure" "dotsDir"])
    ];

    hjem.extraModules = [inputs.hjem-impure.hjemModules.default];

    hjem.users.${username} = {
      enable = true;
      user = username;
      directory = "/home/${username}";

      impure = {
        enable = true;
        dotsDir = "${../../impure}";
        dotsDirImpure = confDir + "/impure";
      };
    };
  };
}
