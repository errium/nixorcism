{
  inputs,
  lib,
  username,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = let
    keyExists = builtins.pathExists "/home/${username}/.config/sops/age/keys.txt";
  in {
    defaultSopsFile = ../.secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    secrets = {
      root-password.neededForUsers = true;
      user-password.neededForUsers = true;

      ssh-private-key =
        lib.mkIf keyExists
        {
          owner = username;
          group = "users";
          mode = "0600";
          path = "/home/${username}/.ssh/id_ed25519";
        };

      ssh-public-key =
        lib.mkIf keyExists
        {
          owner = username;
          group = "users";
          mode = "0644";
          path = "/home/${username}/.ssh/id_ed25519.pub";
        };
    };
  };
}
