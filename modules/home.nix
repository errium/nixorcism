{
  username,
  lib,
  ...
}: {
  imports = [
    (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" username])
  ];

  hm = {
    home.username = "errium";
    home.homeDirectory = "/home/errium";
    home.stateVersion = "25.11";
  };
}
