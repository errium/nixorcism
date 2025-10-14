{
  programs.git = {
    enable = true;
    userName = "Errium";
    userEmail = "197423581+Errium@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [
        "/home/errium/.dotfiles"
      ];
    };
  };
}
