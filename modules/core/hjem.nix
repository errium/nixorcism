{inputs, ...}: {
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    confDir = config.nixorcism.confDir;
    username = config.nixorcism.username;
  in {
    imports = [
      inputs.hjem.nixosModules.default
      (lib.mkAliasOptionModule ["hj"] ["hjem" "users" username])
      (lib.mkAliasOptionModule ["impureDir"] ["hjem" "users" username "impure" "dotsDir"])
    ];

    hjem.extraModules = with inputs; [
      hjem-rum.hjemModules.default
      hjem-impure.hjemModules.default
    ];

    hjem.clobberByDefault = true;

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
