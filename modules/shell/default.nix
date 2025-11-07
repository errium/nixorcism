{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./aliases.nix
    ./bash.nix
    ./fish.nix
    ./oh-my-posh.nix
    ./starship.nix
    ./zsh.nix
  ];

  options.nixorcism.shell = {
    userShell = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum ["bash" "zsh" "fish"]);
      default = null;
      description = "Default shell for the user";
    };
  };

  config = lib.mkIf (config.nixorcism.shell.userShell != null) {
    users.users.${username}.shell =
      {
        bash = pkgs.bash;
        fish = pkgs.fish;
        zsh = pkgs.zsh;
      }.${
        config.nixorcism.shell.userShell
      };
  };
}
