{
  # Lame, but eh, whatchu gonna do?
  # I didn't find a better place for this
  flake.modules.nixos.feature_security = {pkgs, ...}: {
    networking.nftables.enable = true;
    security.auditd.enable = true;

    environment.systemPackages = with pkgs; [aide];

    boot.kernel.sysctl = {
      "kernel.dmesg_restrict" = 1; # Hide dmesg from unprivileged users
      "kernel.kptr_restrict" = 2; # Hide kernel addresses from /proc

      "net.ipv4.tcp_syncookies" = 1; # Mitigate SYN flood attacks

      "net.ipv4.conf.all.rp_filter" = 1; # Drop packets with spoofed source IPs
      "net.ipv6.conf.all.rp_filter" = 1; # Same for IPv6

      "net.ipv4.conf.all.accept_redirects" = 0; # Ignore ICMP redirects (MITM vector)
      "net.ipv6.conf.all.accept_redirects" = 0; # Same for IPv6
      "net.ipv4.conf.all.send_redirects" = 0; # Don't act as a router
    };
  };
}
