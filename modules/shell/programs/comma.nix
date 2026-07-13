{inputs, ...}: {
  flake.modules.nixos.programs'comma = {
    imports = [inputs.nix-index-database.nixosModules.default];

    programs.nix-index-database.comma.enable = true;

    nixorcism.preserve.user.files = [".local/state/comma/choices"];
  };
}
