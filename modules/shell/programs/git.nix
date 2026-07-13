{
  flake.modules.nixos.programs'git = {
    programs.git.enable = true;

    hj.xdg.config.files."git/config".text = ''
      [user]
      	name = Errium
      	email = 197423581+Errium@users.noreply.github.com

      [init]
      	defaultBranch = main

      [pull]
      	rebase = true

      [push]
      	autoSetupRemote = true
    '';
  };
}
