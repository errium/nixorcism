{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell = {
    bash.enable = lib.mkEnableOption "Enables bash";
  };

  config = lib.mkIf config.nixorcism.shell.bash.enable {
    programs.bash.enable = true;

    hm = {
      programs.bash = {
        enable = true;
      };
    };
  };
}
