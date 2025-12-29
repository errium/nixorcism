{ config, lib, pkgs, ... }: {
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

    users.groups.libvirtd.members = [config.nixorcism.core.user.name];
    users.groups.kvm.members = [config.nixorcism.core.user.name];

    programs.virt-manager.enable = true;
  };
}