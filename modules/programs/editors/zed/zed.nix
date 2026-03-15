{
  flake.modules.nixos.editor_zed = {
    hm.programs.zed-editor = {
      enable = true;

      mutableUserDebug = false;
      mutableUserKeymaps = false;
      mutableUserSettings = false;
      mutableUserTasks = false;
    };
  };
}
