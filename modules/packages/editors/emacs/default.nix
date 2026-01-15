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
    nixpkgs.overlays = [inputs.emacs-overlay.overlays.default];
    hm.programs.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
    };
  };
}
