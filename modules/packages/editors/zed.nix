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
        autosave = "on_focus_change";
        base_keymap = "VSCode";
        format_on_save = "on";
        helix_mode = true;
        relative_line_numbers = "enabled";
        theme = lib.mkIf config.stylix.enable "Base16 untitled";
        ui_font_size = lib.mkForce 16;
        wrap_guides = [120];

        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        languages = {
          Go.formatter."external".command = "${pkgs.gofumpt}/bin/gofumpt";
          Nix.formatter."external".command = "${pkgs.alejandra}/bin/alejandra";
        };
      };
    };
  };
}
