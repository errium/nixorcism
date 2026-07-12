{
  flake.modules.nixos.core = {
    config,
    lib,
    pkgs,
    ...
  }: let
    username = config.nixorcism.username;
  in {
    imports = [(lib.mkAliasOptionModule ["userPackages"] ["users" "users" username "packages"])];

    options.nixorcism.confDir = lib.mkOption {
      type = lib.types.str;
      description = "Absolute path to the config directory. Automatically accounts for preservation. Must be in /home.";
      default = "/home/${username}/nixorcism";
    };

    config = {
      nixorcism.preserve.user.directories = [(baseNameOf config.nixorcism.confDir)];

      # bash
      nixorcism.preserve.user.files = [".bash_history"];
      programs.bash = {
        enable = true;
        completion.enable = true;
        promptInit = ''
          PS1='\
          \[\e[92;1m\]\u@\h\[\e[0m\] \
          \[\e[94;1m\]\W\[\e[0m\] \
          \[\e[1;2m\]\$\[\e[0m\] \
          '
        '';
      };

      # i18n
      i18n.defaultLocale = "en_US.UTF-8";
      time.timeZone = "Europe/Vilnius";

      # kernel
      boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

      # openssh
      services.openssh.enable = true;

      # sudo
      nixorcism.preserve.directories = ["/var/db/sudo"];
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
