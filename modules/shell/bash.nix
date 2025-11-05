{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell = {
    bash.enable = lib.mkEnableOption "Enables bash";
  };

  config = lib.mkIf config.nixorcism.shell.bash.enable {
    programs.bash = {
      enable = true;
      completion.enable = true;

      shellAliases = {
        ll = "ls -l";
        c = "clear";
      };

      promptInit = ''
        PS1='\[\e[1;2m\][\[\e[0m\] \[\e[93;1m\]\u\[\e[39m\]@\h\[\e[0m\] \[\e[2m\]in\[\e[0m\] \[\e[93;1m\]\w\[\e[0m\] \[\e[1;2m\]]\[\e[0m\] \[\e[1;2m\]\\$\[\e[0m\] '
      '';
    };
  };
}
