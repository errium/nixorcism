{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.emacs = {
    enable = lib.mkEnableOption "Emacs";
  };

  config = lib.mkIf config.nixorcism.packages.editors.emacs.enable {
    hm = {
      imports = [inputs.nix-doom-emacs-unstraightened.homeModule];

      programs.doom-emacs = {
        enable = true;
        doomDir = ./doom;
        emacs = pkgs.emacs-pgtk;
        tangleArgs = "--all config.org";
      };
    };
  };
}
