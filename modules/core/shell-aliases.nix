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
      description = "Shell aliases, per-module, merged into one big attrset.";
    };

    config = let
      confDir = config.nixorcism.confDir;
    in {
      # Global aliases
      environment.shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        exot = "exit"; # 🤡
        la = "ls -a";
        ll = "ls -lh";
        lla = "ls -lah";
      };

      # User-only aliases
      nixorcism.shellAliases = {
        cc = "cd ~/.config";
        cf = "cd ${confDir}";
        rmf = "rm -rf";
      };
    };
  };
}
