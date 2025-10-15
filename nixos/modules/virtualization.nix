{ pkgs, ... }:

{
  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
  };

  users.groups.libvirtd.members = [ "errium" ];
  users.groups.kvm.members = [ "errium" ];

  programs.virt-manager.enable = true;
}
