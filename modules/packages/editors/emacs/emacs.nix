{
  flake.modules.nixos.emacs = {
    hm = {
      inputs,
      pkgs,
      ...
    }: {
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
