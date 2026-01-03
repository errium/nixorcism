{
  confDir,
  config,
  lib,
  ...
}: let
  commonAliases = {
    ff = "fastfetch";
  };
in {
  options.nixorcism.shell.aliases = lib.mkOption {type = lib.types.attrs;};

  config = {
    environment.shellAliases = {
      cf = "cd ${confDir}";
      la = "ls -a";
      ll = "ls -lh";
      lla = "ls -lah";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };

    nixorcism.shell.aliases = commonAliases;
    hm.home.shellAliases = config.nixorcism.shell.aliases;
  };
}
