{ pkgs, ... }:

{
  users.users.errium = {
    isNormalUser = true;
    description = "errium";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "sound"
      "video"
      "render"
    ];
    packages = with pkgs; [ ];
  };
}
