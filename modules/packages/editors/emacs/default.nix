{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.emacs = {
    enable = lib.mkEnableOption "Emacs";
  };

  config = lib.mkIf config.nixorcism.packages.editors.emacs.enable {
    hm.programs.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
    };

    fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
    ];
  };
}
