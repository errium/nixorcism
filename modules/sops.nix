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
    };
  };
}
