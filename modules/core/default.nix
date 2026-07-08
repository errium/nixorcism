{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    username = config.nixorcism.username;
  in {
    options.nixorcism.confDir = lib.mkOption {
      type = lib.types.str;
      description = "Absolute path to the config directory on the target system.";
      default = "/home/${username}/nixorcism";
    };

    config = {
      # bash
      nixorcism.preserve.user.files = [".bash_history"];
      programs.bash = {
        enable = true;
        completion.enable = true;
        promptInit = ''
          PS1='\[\e[1;2m\][ \[\e[0m\]'\
          '\[\e[92;1m\]\u'\
          '\[\e[39;2m\] · '\
          '\[\e[0;1;96m\]\W'\
          '\[\e[0m\] \[\e[1;2m\]]\[\e[0m\] '\
          '\[\e[1;2m\]\$\[\e[0m\] '
        '';
      };

      # i18n
      i18n.defaultLocale = "en_US.UTF-8";
      time.timeZone = "Europe/Vilnius";

      # sudo
      security.sudo = {
        enable = true;
        extraConfig = ''
          Defaults passwd_timeout=0
          Defaults timestamp_timeout=15
        '';
      };

      # zram
      zramSwap = {
        enable = true;
        algorithm = "lz4";
        memoryPercent = 50;
        priority = 100;
      };
    };
  };
}
