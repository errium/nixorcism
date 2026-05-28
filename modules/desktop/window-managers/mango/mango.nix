{inputs, ...}: {
  flake.modules.nixos.window-manager_mango = {lib, ...}: {
    imports = [inputs.mangowm.nixosModules.mango];

    programs.mango.enable = true;

    # Not the cleanest approach, but hey,
    # if it works, it works
    hm.xdg.configFile."mango/mango.conf".text = let
      appearance = import ./_appearance.nix;
      keybinds = import ./_keybinds.nix;
    in
      lib.concatStrings [
        appearance
        keybinds
      ];
  };
}
