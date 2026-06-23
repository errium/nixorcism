# TEST
nixos-generate-config \
	--show-hardware-config \
	--no-filesystems \
	--root /mnt |
	tee ~/nixorcism/hosts/virtual-nix/_hardware.nix >/dev/null

sudo nix --extra-experimental-features "nix-command flakes pipe-operators" \
	run 'github:nix-community/disko/latest#disko-install' -- \
	--option extra-experimental-features pipe-operators \
	--flake .#virtual-nix \
	--disk main /dev/vda
