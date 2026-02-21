{
  flake.modules.nixos.feature_go = {config, ...}: {
    hm = {
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
