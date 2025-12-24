# NOTE
# This hwconfig is ass, because this host was never used
# Once it does get used this file will be updated by install.sh
{lib, ...}: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2281488";
    fsType = "btrfs";
    options = ["subvol=root"];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
