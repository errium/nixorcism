{
  flake.modules.nixos.sway = {
    hm.wayland.windowManager.sway.config = {
      defaultWorkspace = "workspace number 1";
      bars = [];
    };
  };
}
