{
  flake.modules.nixos.programs'shell-utils = {pkgs, ...}: {
    hm.home.packages = with pkgs; [
      bat
      btop
      dysk
      eza
      fd
      fzf
      ripgrep
      tree
    ];

    hm.programs.zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };

    nixorcism.preserve.user.directories = [".local/share/zoxide"];
  };
}
