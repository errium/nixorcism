{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop.sound = {
    enable = lib.mkEnableOption "sound configuration";
  };

  config = lib.mkIf config.nixorcism.desktop.sound.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
