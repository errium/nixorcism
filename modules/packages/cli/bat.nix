{
  flake.modules.nixos.bat = {pkgs, ...}: {
    hm.programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batgrep
        batman
      ];
    };
  };
}
