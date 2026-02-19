{
  config,
  lib,
  ...
}: {
  options.nixorcism.services.auto-cpufreq = {
    enable = lib.mkEnableOption "auto-cpufreq";
  };

  config = lib.mkIf config.nixorcism.services.auto-cpufreq.enable {
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
