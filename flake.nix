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

      systems = ["x86_64-linux"];
    };

  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    preservation.url = "github:nix-community/preservation";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Programs
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
