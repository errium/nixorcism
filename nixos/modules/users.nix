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

    initialHashedPassword = "$6$J5tkRR5KNR79vy3W$JUr0BdMxrGtLuD3ypv29JQn7VE/Rxcf.MCC/8irttQ2pw5NbJAz.iR4.eXw6q6pZW/QP/.A6mtqHCPeE2sxEH.";
  };
}
