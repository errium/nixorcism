{inputs, ...}: {
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    username = config.nixorcism.username;
  in {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" username])
    ];

    # TEST: hjem-impure spoiled me. A couple of quirks made me go back to
    # home-manager, but I couldn't let go of out of store configs.
    # This monstrosity tries to recreate that workflow with mkOutOfStoreSymlink.
    options.nixorcism.mkImpureConf = lib.mkOption {
      type = lib.types.functionTo lib.types.attrs;
      readOnly = true;
      description = "Maps config paths in ~/.config to files in ./impure.";
    };

    config = {
      # TEST: mkImpureConf
      nixorcism.mkImpureConf = target: impureRelPath: let
        sourcePath = "${config.nixorcism.confDir}/impure/${impureRelPath}";
      in {
        hm.xdg.configFile.${target}.source =
          config.lib.file.mkOutOfStoreSymlink sourcePath;
      };

      home-manager = {
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
      };

      hm.home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.11";
      };
    };
  };
}
