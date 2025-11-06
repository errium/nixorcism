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
      ll = "ls -l";
      la = "ls -a";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };

    hm.home.shellAliases = let
      confDir = "~/nixorcism";
      sudo = "sudo";
    in {
      ll = "eza -l";
      la = "eza -a";
      ff = "fastfetch";

      nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
      gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
      ngc = "${sudo} nix-collect-garbage -d";
      upd = "nix flake update --flake ${confDir}";
      upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
    };
  };
}
