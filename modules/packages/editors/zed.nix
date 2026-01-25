{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.zed = {
    enable = lib.mkEnableOption "Zed";
  };

  config = lib.mkIf config.nixorcism.packages.editors.zed.enable {
    hm.programs.zed-editor = {
      enable = true;

      mutableUserDebug = false;
      mutableUserKeymaps = false;
      mutableUserSettings = false;
      mutableUserTasks = false;

      extensions = ["nix"];
      extraPackages = with pkgs; [
        nil
        nixd
      ];

      userSettings = {
        base_keymap = "VSCode";
        helix_mode = true;
        theme = lib.mkIf config.stylix.enable "Base16 untitled";
        ui_font_size = lib.mkForce 16;
        wrap_guides = [120];

        telemetry = {
          metrics = false;
          diagnostics = false;
        };
      };
    };
  };
}
