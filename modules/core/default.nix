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
      description = "Absolute path to the config directory. Automatically accounts for preservation. Must be in /home.";
      default = "/home/${username}/nixorcism";
    };

    config = {
      nixorcism.preserve.user.directories = [(baseNameOf config.nixorcism.confDir)];

      # bash
      programs.bash = {
        enable = true;
        completion.enable = true;
        promptInit = ''
          PS1='\[\e[1;2m\]['\
          '\[\e[0;1;92m\]\u'\
          '\[\e[0;2m\]:'\
          '\[\e[0;96;1m\]\W'\
          '\[\e[39;2m\]]\$'\
          '\[\e[0m\] '
        '';
      };
      nixorcism.preserve.user.files = [".bash_history"];

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
