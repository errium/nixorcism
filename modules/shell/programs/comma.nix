{inputs, ...}: {
  flake.modules.nixos.program'comma = {
    imports = [inputs.nix-index-database.nixosModules.default];

    nixorcism.preserve.user.files = [".local/state/comma/choices"];

    programs.nix-index-database.comma.enable = true;
  };
}
