{
  config,
  inputs,
  lib,
  ...
}: {
  options.nixorcism.packages.gui = {
    librewolf.enable = lib.mkEnableOption "Enables librewolf";
  };

  config = lib.mkIf config.nixorcism.packages.gui.librewolf.enable {
    hm.programs.librewolf = {
      enable = true;
      languagePacks = ["ru" "en-US"];

      profiles.default = {
        isDefault = true;

        extensions = {
          force = true;
          packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            auto-tab-discard
            bonjourr-startpage
            darkreader
            privacy-badger
            return-youtube-dislikes
            sponsorblock
            ublock-origin
          ];
        };
      };
    };
  };
}
