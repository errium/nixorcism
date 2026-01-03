{
  config,
  lib,
  ...
}: let
  confDir = "~/nixorcism";
  commonAliases = {
    ff = "fastfetch";
    la = "eza -a";
    ll = "eza -lh";
    lla = "eza -lah";
    # gen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
    # ngc = "sudo nix-collect-garbage -d";
    # nrs = "sudo nixos-rebuild switch --flake ${confDir}";
    # upd = "nix flake update --flake ${confDir}";
    # upg = "sudo nixos-rebuild switch --upgrade --flake ${confDir}";
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
