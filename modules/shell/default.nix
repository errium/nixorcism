{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  cfg = config.nixorcism.shell;

  shellPackages = {
    bash = pkgs.bash;
    fish = pkgs.fish;
    zsh = pkgs.zsh;
  };
in {
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

    userPrompt = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum ["starship" "oh-my-posh"]);
      default = null;
      description = "Default prompt for the user";
    };
  };

  config = lib.mkIf (cfg.userShell != null) {
    users.users.${username}.shell = shellPackages.${cfg.userShell};

    # TODO
    # I probably should troubleshoot this, as it doesn't seem to work
    # ...But I probably wont do that any time soon :clown_face:
    # hm.home.sessionVariables = {
    #   NIX_BUILD_SHELL = "${shellPackages.${cfg.userShell}}/bin/${cfg.userShell}";
    # };
  };
}
