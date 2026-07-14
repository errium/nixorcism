# NOTE: This doesn't really fit here, but it's kept here because
# everything under core/ is part of the always-enabled core module.
# I want my aliases and custom options to be active regardless of
# the system configuration, hence keeping them here.
{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: {
    options.nixorcism.shellAliases = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
    };

    config = let
      confDir = config.nixorcism.confDir;
    in {
      # Global aliases
      environment.shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        cf = "cd ${confDir}";
        exot = "exit"; # 🤡
        la = "ls -a";
        ll = "ls -lh";
        lla = "ls -lah";
      };

      # User-only aliases
      nixorcism.shellAliases.rmf = "rm -rf";
    };
  };
}
