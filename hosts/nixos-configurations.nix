{
  config,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules =
          [
            config.flake.modules.nixos.${hostname}
            {networking.hostName = hostname;}
          ]
          ++ (with config.flake.modules.nixos; [
            core
          ]);
      };
  in {
    dudos-machine = mkHost "dudos-machine";
    virtual-nix = mkHost "virtual-nix";
  };
}
