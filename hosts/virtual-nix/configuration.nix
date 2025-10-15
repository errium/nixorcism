{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.git.enable = true;
  services.openssh.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "virtual-nix";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Vilnius";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

  users.users.errium = {
    isNormalUser = true;
    description = "Errium";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [

    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    helix
    fastfetch
  ];

  system.stateVersion = "25.05";
}
