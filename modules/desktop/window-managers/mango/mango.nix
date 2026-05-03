{inputs, ...}: {
  flake.modules.nixos.window-manager_mango = {
    imports = [inputs.mangowm.nixosModules.mango];

    programs.mangowc.enable = true;
  };
}
