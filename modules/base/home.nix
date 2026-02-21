{
  flake.modules.nixos.base = {
    lib,
    username,
  }: {
    imports = [(lib.mkAliasOptionModule ["hm"] ["home-manager" "users" username])];

    hm = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
    };
  };
}
