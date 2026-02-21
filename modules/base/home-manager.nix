{
  flake.modules.nixos.base = {
    lib,
    username,
    ...
  }: {
    imports = [(lib.mkAliasOptionModule ["hm"] ["home-manager" "users" username])];

    # NOTE: Potential error source. Needs further observation
    home-manager = {
      backupFileExtension = "backup";
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    hm = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
    };
  };
}
