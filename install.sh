sudo NIX_CONFIG="extra-experimental-features = pipe-operators" \
	nix run 'github:nix-community/disko/latest' -- \
	--mode destroy,format,mount \
	--flake .#virtual-nix

lsblk -f

nixos-generate-config --no-filesystems --root /mnt --show-hardware-config |
	tee hosts/virtual-nix/_hardware.nix >/dev/null

sudo NIX_CONFIG="extra-experimental-features = pipe-operators" \
	nixos-install --flake .#virtual-nix --no-root-passwd
