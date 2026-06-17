{
  flake.modules.nixos.desktop-extra_noctalia = {
    services.upower.enable = true;

    hm = {inputs, ...}: {
      imports = [inputs.noctalia.homeModules.default];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
