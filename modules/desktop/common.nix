{
  flake.modules.nixos.desktopCommon = {
    # Sound
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    security.rtkit.enable = true;

    # xkb
    services.xserver = {
      xkb.layout = "us, ru";
      xkb.options = "grp:alt_shift_toggle";

      autoRepeatDelay = 300;
      autoRepeatInterval = 35;
    };
  };
}
