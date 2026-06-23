# TEST:
# Don't look here, this script isn't even a WIP.
# Its sole purpose is to help me test some stuff by installing the system for me.

nixos-generate-config \
	--show-hardware-config \
	--no-filesystems \
	--root /mnt |
	tee ~/nixorcism/hosts/virtual-nix/_hardware.nix >/dev/null
