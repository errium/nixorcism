# TEST:
# Don't look here, this script isn't even a WIP.
# Its sole purpose is to help me test some stuff by installing the system for me.

sudo NIX_CONFIG="extra-experimental-features = pipe-operators" \
	nix run 'github:nix-community/disko/latest' -- \
	--mode destroy,format,mount \
	--yes-wipe-all-disks \
	--flake .#virtual-nix

nixos-generate-config --root /mnt \
	--show-hardware-config \
	--no-filesystems |
	tee ~/nixorcism/hosts/virtual-nix/_hardware.nix >/dev/null

sudo nixos-install --flake .#virtual-nix --no-root-passwd
