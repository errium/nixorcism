{
  flake.modules.nixos.go = {
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
