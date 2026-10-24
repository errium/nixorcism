{
  flake.modules.nixos.core = {
    networking = {
      firewall.enable = true;
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };
    };

    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNS = "9.9.9.9#dns.quad9.net";
        FallbackDNS = "1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google";
        DNSOverTLS = "true";
        DNSSEC = "true";
        Domains = "~.";
      };
    };

    nixorcism.preserve.directories = ["/etc/NetworkManager/system-connections"];
  };
}
