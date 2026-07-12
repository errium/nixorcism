# NOTE: This file is not imported via mkImport,
# so it doesn't need to be a flake-parts module.
# It's imported manually by each DE/WM config.
{
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

  # Misc
  imports = [./_fonts.nix];
  services.gvfs.enable = true;
}
