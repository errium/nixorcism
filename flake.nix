{
  description = "~/nixorcism";

  outputs = inputs: let
    # mkImport recursively imports all .nix files, skipping flake.nix and files prefixed with _.
    inherit (inputs.nixpkgs.lib) hasPrefix;
    inherit (inputs.nixpkgs.lib.fileset) toList fileFilter;
    mkImport = path:
      path
      |> fileFilter (file: file.hasExt "nix" && !(hasPrefix "_" file.name) && file.name != "flake.nix")
      |> toList;
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = with inputs;
        [flake-parts.flakeModules.modules]
        ++ (mkImport ./hosts)
        ++ (mkImport ./modules);
    };

  inputs = {
    # Core
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    preservation.url = "github:nix-community/preservation";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hjem
    hjem.follows = "hjem-rum/hjem";
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };

    # Programs
    helium = {
      url = "github:amaanq/helium-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
