{
  flake.modules.nixos.base = {
    networking = {
      networkmanager.enable = true;
      firewall.enable = true;
    };

    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNS = [
          "9.9.9.9#dns.quad9.net"
          "1.1.1.1#cloudflare-dns.com"
        ];
        DNSOverTLS = "true";
        DNSSEC = "true";
        Domains = "~.";
      };
    };
  };
}
