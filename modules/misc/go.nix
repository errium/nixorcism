{
  config,
  lib,
  ...
}: {
  options.nixorcism.misc.go = {
    enable = lib.mkEnableOption "Go configuration";
  };

  config = lib.mkIf config.nixorcism.misc.go.enable {
    hm = {config, ...}: {
      programs.go = {
        enable = true;

        telemetry.mode = "off";

        env = {
          GOPATH = "${config.home.homeDirectory}/go";
        };
      };
    };
  };
}
