{
  flake.modules.nixos.hardening = {pkgs, ...}: {
    # General
    environment.systemPackages = with pkgs; [aide];
    networking.nftables.enable = true;
    security.auditd.enable = true;
    security.polkit.enable = true;

    # https://github.com/V4bel/dirtyfrag
    boot.blacklistedKernelModules = ["esp6" "esp4" "rxrpc"];

    # Kernel tweaks
    boot.kernel.sysctl = {
      "kernel.dmesg_restrict" = 1; # hide dmesg from unprivileged users
      "kernel.kptr_restrict" = 2; # hide kernel addresses from /proc

      "net.ipv4.tcp_syncookies" = 1; # mitigate SYN flood attacks
      "net.ipv4.conf.all.send_redirects" = 0; # don't act as a router

      "net.ipv4.conf.all.rp_filter" = 1; # drop packets with spoofed source IPs
      "net.ipv6.conf.all.rp_filter" = 1;

      "net.ipv4.conf.all.accept_redirects" = 0; # ignore ICMP redirects (MITM vector)
      "net.ipv6.conf.all.accept_redirects" = 0;
    };
  };
}
