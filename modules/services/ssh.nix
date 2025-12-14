{
  config,
  lib,
  username,
  ...
}: {
  options.nixorcism.services = {
    ssh.enable = lib.mkEnableOption "Enables ssh";
  };

  config = lib.mkIf config.nixorcism.services.ssh.enable {
    services.openssh.enable = true;

    sops.secrets = {
      ssh-public = {
        owner = username;
        group = "users";
        mode = "0644";
        path = "/home/${username}/.ssh/id_ed25519.pub";
      };

      ssh-private = {
        owner = username;
        group = "users";
        mode = "0600";
        path = "/home/${username}/.ssh/id_ed25519";
      };
    };
  };
}
