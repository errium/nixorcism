{inputs, ...}: {
  flake.modules.nixos.programs'helium = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    nixorcism.preserve.user.directories = [
      ".cache/net.imput.helium"
      ".config/net.imput.helium"
    ];
  };
}
