{
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;

    xkb.layout = "us, ru";
    xkb.options = "grp:alt_shift_toggle";

    autoRepeatDelay = 300;
    autoRepeatInterval = 35;
  };

  services.libinput = {
    enable = true;

    mouse = {
      accelProfile = "flat";
      accelSpeed = "0.2";
    };

    touchpad = {
      tapping = true;
      naturalScrolling = true;
      disableWhileTyping = true;
      accelSpeed = "0.3";
    };
  };
}
