{
  flake.modules.nixos.feature_go = {
    config,
    pkgs,
    ...
  }: {
    hm.programs.go = {
      enable = true;
      telemetry.mode = "off";

      env = {
        GOPATH = "${config.home.homeDirectory}/go";
      };
    };

    hm.home.packages = with pkgs; [
      golangci-lint
      gotests
    ];
  };
}
