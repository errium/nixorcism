{
  flake.modules.nixos.shell_common = {confDir, ...}: let
    aliases = {
      ff = "fastfetch";
      lat = "eza -lahT";
      lt = "eza -lhT";
      rmf = "rm -rf";

      cgr = "cargo run";
      glf = "golangci-lint fmt";
      glr = "golangci-lint run";
      gr = "go run";
      grm = "go run main.go";
    };
  in {
    environment.shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      cf = "cd ${confDir}";
      la = "ls -a";
      ll = "ls -lh";
      lla = "ls -lah";
    };

    hm.programs.fish.shellAbbrs = aliases;
    hm.programs.zsh.shellAliases = aliases;
  };
}
