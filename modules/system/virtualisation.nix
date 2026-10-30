{
  flake.modules.nixos.system'virtualisation = {
    config,
    pkgs,
    ...
  }: {
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

    programs.virt-manager.enable = true;

    users.users.${config.nixorcism.username}.extraGroups = [
      "libvirtd"
      "kvm"
    ];

    nixorcism.preserve.directories = ["/var/lib/libvirt"];
  };
}
