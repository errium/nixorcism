{
  flake.modules.nixos.window-manager_sway = {
    hm.wayland.windowManager.sway.config = {
      defaultWorkspace = "workspace number 1";
      bars = [];
    };
  };
}
