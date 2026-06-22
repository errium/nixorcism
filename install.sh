# TEST

sudo nix --extra-experimental-features "nix-command flakes pipe-operators" \
	run 'github:nix-community/disko/latest#disko-install' -- \
	--option extra-experimental-features pipe-operators \
	--flake .#virtual-nix \
	--disk main /dev/vda

sudo mount -o subvol=persistent /dev/vda4 /mnt

sudo cp -r ~/nixorcism/* /mnt/etc/nixos
