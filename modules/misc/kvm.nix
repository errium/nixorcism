{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  options.nixorcism.misc.kvm = {
    enable = lib.mkEnableOption "Enable KVM virtualization support";
  };

  config = lib.mkIf config.nixorcism.misc.kvm.enable {
    virtualisation = {
      spiceUSBRedirection.enable = true;

      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          swtpm.enable = true;
          vhostUserPackages = [pkgs.virtiofsd];
        };
      };
    };

    users.groups.libvirtd.members = [username];
    users.groups.kvm.members = [username];

    programs.virt-manager.enable = true;
  };
}
