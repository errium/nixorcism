{
  flake.modules.nixos.shell_aliases = {confDir, ...}: let
    userAliases = {
      # General
      ff = "fastfetch";
      lat = "eza -lahT";
      lt = "eza -lhT";
      rmf = "rm -rf";

      # Rust
      cb = "cargo build";
      cbr = "cargo build --release";
      cc = "cargo check";
      cr = "cargo run";
      crr = "cargo run --release";
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

    hm.programs.fish.shellAbbrs = userAliases;
  };
}
