{
  flake.modules.nixos.service_auto-cpufreq = {
    services.auto-cpufreq = {
      enable = true;

      settings = {
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
  };
}
