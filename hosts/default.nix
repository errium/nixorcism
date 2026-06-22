{
  config,
  inputs,
  ...
}: let
  # Some special args
  username = "errium";
  confDir = "/home/${username}/nixorcism";
in {
  flake.nixosConfigurations = let
    # Function that actually creates hosts
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username confDir;};
        modules = [
          config.flake.modules.nixos.${hostname}
          {networking.hostName = hostname;}
        ];
      };
  in {
    virtual-nix = mkHost "virtual-nix";
  };
}
