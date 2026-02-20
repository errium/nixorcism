{
  flake.modules.nixos.btop = {pkgs, ...}: {
    hm = {
      programs.btop = {
        enable = true;
        package = pkgs.btop-cuda;

        settings = {
          theme_background = false;
          rounded_corners = false;
          update_ms = 200;
        };
      };
    };
  };
}
