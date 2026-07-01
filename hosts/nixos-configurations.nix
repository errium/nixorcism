{
  config,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          config.flake.modules.nixos.${hostname}
          config.flake.modules.nixos.core
          {networking.hostName = hostname;}
        ];
      };
  in {
    virtual-nix = mkHost "virtual-nix";
  };
}
