{
  flake.modules.nixos.editor_doom-emacs = {
    inputs,
    pkgs,
    ...
  }: {
    hm = {
      imports = [inputs.nix-doom-emacs-unstraightened.homeModule];
      programs.doom-emacs = {
        enable = true;
        doomDir = ./config;
        emacs = pkgs.emacs-pgtk;
        tangleArgs = "--all config.org";
      };
    };
  };
}
