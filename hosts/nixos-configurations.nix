{
  config,
  inputs,
  ...
}: let
  # Some special args
  confDir = toString ./.;
  username = "errium";
in {
  flake.nixosConfigurations = let
    # Function that actually creates hosts
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs confDir username;};
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
