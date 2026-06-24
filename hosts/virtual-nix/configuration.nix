{
  flake.modules.nixos.virtual-nix = {
    config,
    lib,
    pkgs,
    ...
  }: let
    # TEST
    zfsCompatibleKernelPackages =
      lib.filterAttrs (
        name: kernelPackages:
          (builtins.match "linux_[0-9]+_[0-9]+" name)
          != null
          && (builtins.tryEval kernelPackages).success
          && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
      )
      pkgs.linuxKernel.packages;

    latestZfsKernel = lib.last (
      lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
        builtins.attrValues zfsCompatibleKernelPackages
      )
    );
  in {
    imports = [./_hardware.nix];

    system.stateVersion = "25.11";
    boot.kernelPackages = latestZfsKernel;

    nixorcism.bootloader = "systemd-boot";
  };
}
