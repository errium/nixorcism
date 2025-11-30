{
  inputs,
  username,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = {
    defaultSopsFile = ../.secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    secrets = {
      root-password.neededForUsers = true;
      user-password.neededForUsers = true;

      ssh-private-key = {
        owner = username;
        group = "users";
        mode = "0600";
        path = "/home/${username}/.ssh/id_ed25519";
      };

      ssh-public-key = {
        owner = username;
        group = "users";
        mode = "0644";
        path = "/home/${username}/.ssh/id_ed25519.pub";
      };
    };
  };
}
