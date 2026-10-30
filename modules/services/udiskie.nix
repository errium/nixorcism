{
  flake.modules.nixos.services'udiskie = {
    lib,
    pkgs,
    ...
  }: {
    services.udisks2.enable = true;

    hj.packages = with pkgs; [udiskie];

    hj.xdg.config.files."udiskie/config.yml" = {
      generator = lib.generators.toYAML {};
      value.program_options = {
        automount = true;
        notify = true;
        tray = "auto";
      };
    };

    systemd.user.services.udiskie = {
      description = "udiskie mount daemon";
      after = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      serviceConfig.ExecStart = lib.getExe' pkgs.udiskie "udiskie";
    };
  };
}
