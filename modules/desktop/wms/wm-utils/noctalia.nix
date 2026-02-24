{
  flake.modules.nixos.wm-utils_noctalia = {
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
