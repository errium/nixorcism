{
  flake.modules.nixos.wm_sway = {
    hm.wayland.windowManager.sway.config = {
      defaultWorkspace = "workspace number 1";
      bars = [];
    };
  };
}
