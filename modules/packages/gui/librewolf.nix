{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui = {
    librewolf.enable = lib.mkEnableOption "Enables librewolf";
  };

  config = lib.mkIf config.nixorcism.packages.gui.librewolf.enable {
    hm.programs.librewolf = {
      enable = true;

      languagePacks = [
        "ru"
        "en-US"
      ];

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFormHistory = false;

        DisplayBookmarksToolbar = "never";

        ExtensionSettings = {
          # "uBlock0@raymondhill.net" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          #   installation_mode = "force_installed";
          # };
        };
      };
    };
  };
}
