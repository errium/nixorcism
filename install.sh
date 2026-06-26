#!/usr/bin/env bash
set -euo pipefail

# TEST:
# Don't look here, this script isn't even a WIP.
# Its sole purpose is to help me test some stuff by installing the system for me.

# Partition and format
sudo NIX_CONFIG="extra-experimental-features = nix-command flakes pipe-operators" \
	nix --extra-experimental-features "nix-command flakes pipe-operators" \
	run 'github:nix-community/disko/latest' -- \
	--mode destroy,format,mount \
	--yes-wipe-all-disks \
	--flake .#virtual-nix

# Generate hardware config
nixos-generate-config \
	--show-hardware-config \
	--no-filesystems \
	--root /mnt |
	tee ~/nixorcism/hosts/virtual-nix/_hardware.nix >/dev/null

# TEST
sudo systemd-machine-id-setup --root=/mnt

# Install
sudo NIX_CONFIG="extra-experimental-features = pipe-operators" \
	nixos-install \
	--no-root-passwd \
	--flake .#virtual-nix

# Copy config
sudo mkdir -p /mnt/home/errium/nixorcism
sudo cp -rT ~/nixorcism /mnt/home/errium/nixorcism
sudo nixos-enter --root /mnt -c \
	"chown -R errium:users /home/errium/nixorcism"
