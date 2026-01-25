{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.editors.zed = {
    enable = lib.mkEnableOption "Zed";
  };

  config = lib.mkIf config.nixorcism.packages.editors.zed.enable {
    hm.programs.zed-editor = {
      enable = true;

      mutableUserKeymaps = false;
      mutableUserSettings = false;

      extensions = ["nix"];

      userSettings = {
        base_keymap = "VSCode";
        buffer_font_size = lib.mkForce 17;
        features.copilot = false;
        helix_mode = true;
        theme = "Base16 untitled";

        telemetry = {
          metrics = false;
          diagnostics = false;
        };
      };
    };
  };
}
