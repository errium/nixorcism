{
  flake.modules.nixos.program'fastfetch = {pkgs, ...}: {
    userPackages = with pkgs; [fastfetch];
  };
}
