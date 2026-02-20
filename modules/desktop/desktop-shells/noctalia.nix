{
  flake.modules.nixos.noctalia = {
    services.upower.enable = true;

    hm = {inputs, ...}: {
      imports = [inputs.noctalia.homeModules.default];
      programs.noctalia-shell = {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
