{
  flake.modules.nixos.program'shell-utils = {pkgs, ...}: {
    userPackages = with pkgs; [
      bat
      btop
      dysk
      eza
      fd
      fzf
      ripgrep
      tree
    ];

    programs.zoxide = {
      enable = true;
      enableBashIntegration = false;
      flags = ["--cmd cd"];
    };

    nixorcism.preserve.user.files = [".local/share/zoxide/db.zo"];
  };
}
