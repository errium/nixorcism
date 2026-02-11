{
  confDir,
  config,
  lib,
  ...
}: let
  commonAliases = {
    ff = "fastfetch";
    lat = "eza -lahT";
    lt = "eza -lhT";
    rmf = "rm -rf";

    cgr = "cargo run";
    glf = "golangci-lint fmt";
    glr = "golangci-lint run";
    grm = "go run main.go";
  };
in {
  options.nixorcism.shell.aliases = lib.mkOption {type = lib.types.attrs;};

  config = {
    environment.shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      cf = "cd ${confDir}";
      la = "ls -a";
      ll = "ls -lh";
      lla = "ls -lah";
    };

    nixorcism.shell.aliases = commonAliases;
    hm.home.shellAliases = config.nixorcism.shell.aliases;
  };
}
