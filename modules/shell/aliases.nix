{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell = {
    aliases.enable = lib.mkEnableOption "Enables global shell aliases";
  };

  config = lib.mkIf config.nixorcism.shell.aliases.enable {
    environment.shellAliases = {
      la = "ls -a";
      ll = "ls -lh";
      lla = "ls -lah";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };

    hm.home.shellAliases = let
      confDir = "~/nixorcism";
    in {
      la = "eza -a";
      ll = "eza -lh";
      lla = "eza -lah";
      ff = "fastfetch";

      nrs = "sudo nixos-rebuild switch --flake ${confDir}";
      gen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      ngc = "sudo nix-collect-garbage -d";
      upd = "nix flake update --flake ${confDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${confDir}";
    };
  };
}
