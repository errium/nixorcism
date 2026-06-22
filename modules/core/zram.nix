{
  # It's a part of core module because
  # I want ZRAM on all my machines.
  flake.modules.nixos.core = {
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 50;
      priority = 100;
    };
  };
}
