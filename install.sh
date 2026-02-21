#!/usr/bin/env bash
set -euo pipefail

# ┏━╸╻  ┏━┓┏┓ ┏━┓╻  ┏━┓
# ┃╺┓┃  ┃ ┃┣┻┓┣━┫┃  ┗━┓
# ┗━┛┗━╸┗━┛┗━┛╹ ╹┗━╸┗━┛
readonly BOLD="\033[1m"
readonly BOLD_RED="\033[1;31m"
readonly BOLD_YELLOW="\033[1;33m"
readonly DIM="\033[2m"
readonly RESET="\033[0m"

readonly CLR1="\033[0;32m"  # GREEN
readonly CLR1B="\033[1;32m" # BOLD_GREEN
readonly CLR2="\033[0;35m"  # MAGENTA
readonly CLR2B="\033[1;35m" # BOLD_MAGENTA

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ╻ ╻┏━╸╻  ┏━┓┏━╸┏━┓┏━┓
# ┣━┫┣╸ ┃  ┣━┛┣╸ ┣┳┛┗━┓
# ╹ ╹┗━╸┗━╸╹  ┗━╸╹┗╸┗━┛
# Extract username from newly installed system
get_username() {
	awk -F: '$3 >= 1000 && $3 < 2000 {print $1; exit}' /mnt/etc/passwd
}

# Print colored status messages with icons
print_status() {
	local status="$1"
	local message="$2"
	local color
	local icon
	case "$status" in
	"OK")
		color="$CLR2B"
		icon="*"
		;;
	"WARNING")
		color="$BOLD_YELLOW"
		icon="!"
		;;
	"FAILED")
		color="$BOLD_RED"
		icon="X"
		;;
	"INFO")
		color="$CLR1B"
		icon="ℹ"
		;;
	"PROMPT")
		color="$CLR1B"
		icon="?"
		;;
	*)
		color="$BOLD"
		icon="$status"
		;;
	esac
	echo -e "${color}${icon}${RESET} ${BOLD}${message}${RESET}"
}

# Prompt for text input
prompt_input() {
	local prompt="$1"
	local var_name="$2"
	local color="${3:-$DIM}"
	echo -ne "${color}>${RESET} ${BOLD}${prompt}${RESET}"
	read -r "$var_name"
}

# Prompt for yes/no confirmation
prompt_confirm() {
	local prompt="$1"
	local color="${2:-$DIM}"
	while true; do
		read -rp "$(echo -e "${color}>${RESET} ${BOLD}${prompt}${RESET} ${DIM}[y/n]${RESET}: ")" response
		case "$response" in
		y) return 0 ;;
		n) return 1 ;;
		*) print_status "FAILED" "Please type 'y' or 'n'" ;;
		esac
	done
}

# ┏┓ ┏━┓┏┓╻┏┓╻┏━╸┏━┓┏━┓
# ┣┻┓┣━┫┃┗┫┃┗┫┣╸ ┣┳┛┗━┓
# ┗━┛╹ ╹╹ ╹╹ ╹┗━╸╹┗╸┗━┛
greeting_banner() {
	local accent1=(
		" ▄     ${CLR2B}▀▀        "
		" ████▄▀██▀██ ██▀ "
		" ██ ██ ██  ███   "
		"▄██ ▀█▄██▄██ ██▄▄"
	)
	local accent2=(
		"                 ${CLR1B}▀▀${CLR2B}       ▄"
		"▄███▄ ████▄▄███▀ ██ ▄██▀█ ███▄███▄"
		"██ ██ ██   ██    ██ ▀███▄ ██ ██ ██"
		"${CLR2}▀███▀▄█▀   ▀███▄▄███▄▄██▀▄██ ██ ▀█"
	)

	for i in {0..3}; do
		echo -e "${CLR1B}${accent1[i]}${CLR2B}${accent2[i]}${RESET}"
	done
	echo ""
}

completion_banner() {
	local accent1=(
		"    █▄                  "
		"    ██       ▄          "
		" ▄████ ▄███▄ ████▄ ▄█▀█▄"
		" ██ ██ ██ ██ ██ ██ ██▄█▀"
		"${CLR1}▄█▀███▄▀███▀▄██ ▀█▄▀█▄▄▄"
	)
	local accent2=(
		"▄█"
		"██"
		"██"
		"  "
		"██"
	)

	echo ""
	for i in {0..4}; do
		echo -e "${CLR1B}${accent1[i]}${RESET} ${CLR2B}${accent2[i]}${RESET}"
	done
	echo ""
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╺┓          ┏━╸╻ ╻┏━╸┏━╸╻┏ ┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸     ┃    ╺━╸   ┃  ┣━┫┣╸ ┃  ┣┻┓┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ╺┻╸         ┗━╸╹ ╹┗━╸┗━╸╹ ╹┗━┛
check_root() {
	if [[ $EUID -eq 0 ]]; then
		print_status "OK" "Running as root"
	else
		print_status "FAILED" "This script must be run as root"
		exit 1
	fi
}

check_internet() {
	if ping -c 1 nixos.org >/dev/null 2>&1; then
		print_status "OK" "Internet is up"
	else
		print_status "FAILED" "No internet connection"
		exit 1
	fi
}

check_git() {
	if which git >/dev/null 2>&1; then
		print_status "OK" "Git is available"
	else
		print_status "FAILED" "Git is not available"
		exit 1
	fi
}

stage1_checks() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 1 - Checks${RESET}"
	echo ""

	check_root
	check_internet
	check_git

	echo ""
	read -rp "$(echo -e "${DIM}Press Enter to continue...${RESET}")"
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳╸┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┏━┛   ╺━╸   ┣━┛┣┳┛┃ ┃┃┃┃┣━┛ ┃ ┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━╸         ╹  ╹┗╸┗━┛╹ ╹╹   ╹ ┗━┛
# Prompt user to select a host configuration
prompt_host() {
	local hosts_dir="${SCRIPT_DIR}/hosts"
	local hosts=()

	# Find all valid host configurations
	for dir in "$hosts_dir"/*; do
		if [[ -d "$dir" ]] &&
			[[ -f "$dir/_disko.nix" ]] &&
			[[ -f "$dir/configuration.nix" ]] &&
			[[ -f "$dir/_hardware-configuration.nix" ]]; then
			hosts+=("$(basename "$dir")")
		fi
	done

	if [[ ${#hosts[@]} -eq 0 ]]; then
		print_status "FAILED" "No host configurations found"
		exit 1
	fi

	print_status "PROMPT" "Choose a host"
	for i in "${!hosts[@]}"; do
		echo -e "  ${CLR2}$((i + 1))${RESET} ${hosts[i]}"
	done

	while true; do
		prompt_input "" choice
		case "$choice" in
		[0-9]*)
			if ((choice >= 1 && choice <= ${#hosts[@]})); then
				HOSTNAME="${hosts[choice - 1]}"
				break
			fi
			;;
		esac
		print_status "FAILED" "Invalid choice"
	done
	echo ""
}

# Prompt user to select target disk
prompt_disk() {
	local disks=()

	print_status "PROMPT" "Choose a disk"

	# Get list of available disks (excluding loop devices)
	while IFS= read -r line; do
		disks+=("$line")
	done < <(lsblk -ndo NAME,SIZE,MODEL | grep -v 'loop')

	for i in "${!disks[@]}"; do
		echo -e "  ${CLR2}$((i + 1))${RESET} ${disks[i]}"
	done

	while true; do
		prompt_input "" choice
		case "$choice" in
		[0-9]*)
			if ((choice >= 1 && choice <= ${#disks[@]})); then
				DISK="/dev/$(echo "${disks[choice - 1]}" | awk '{print $1}')"
				break
			fi
			;;
		esac
		print_status "FAILED" "Invalid choice"
	done
	echo ""
}

# Prompt user to set passwords for root and user accounts
prompt_password() {
	local user_type="$1"
	local color="$2"
	local pass_var="$3"

	print_status "PROMPT" "Set password for ${color}${user_type}${RESET}"
	while true; do
		read -rsp "$(echo -e "${DIM}>${RESET} ")" pass
		echo ""
		read -rsp "$(echo -e "${DIM}>${RESET} ${BOLD}Confirm:${RESET} ")" pass_confirm
		echo ""

		if [[ "$pass" == "$pass_confirm" ]]; then
			eval "$pass_var='$pass'"
			break
		fi
		print_status "FAILED" "Passwords don't match, try again"
	done
	echo ""
}

stage2_prompts() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 2 - Prompts${RESET}"
	echo ""

	prompt_host
	prompt_disk
	prompt_password "root" "$CLR1" "ROOT_PASS"
	prompt_password "user" "$CLR2" "USER_PASS"

	read -rp "$(echo -e "${DIM}Press Enter to continue...${RESET}")"
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━╸┏━┓┏┓╻┏━╸╻┏━┓┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ╺━┫   ╺━╸   ┃  ┃ ┃┃┗┫┣╸ ┃┣┳┛┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━┛         ┗━╸┗━┛╹ ╹╹  ╹╹┗╸╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
confirm_host() {
	print_status "PROMPT" "Confirm host configuration"
	echo -e "${DIM}│${RESET} Selected host: ${CLR2}${HOSTNAME}${RESET}"
	prompt_confirm "Correct?" || exit 0
	echo ""
}

confirm_disk() {
	print_status "PROMPT" "Confirm disk selection"
	echo -e "${DIM}│${RESET} Selected disk: ${CLR1}${DISK}${RESET}"
	print_status "WARNING" "Chosen disk will be formatted according to _disko.nix file"
	print_status "WARNING" "All data on the chosen disk will be destroyed"
	prompt_confirm "Correct disk?" || exit 0
	echo ""
}

confirm_disko() {
	print_status "PROMPT" "Verify disko configuration"
	echo -e "${DIM}│${RESET} Disko config location: ${CLR2}hosts/${HOSTNAME}/_disko.nix${RESET}"
	prompt_confirm "Have you checked disko.nix?" || exit 1
	echo ""
}

confirm_final() {
	print_status "PROMPT" "Ready to install"
	echo -e "${DIM}│${RESET} Host: ${CLR2}${HOSTNAME}${RESET}"
	echo -e "${DIM}│${RESET} Disk: ${CLR1}${DISK}${RESET}"
	echo -e "${DIM}│${RESET} Config: ${CLR2}hosts/${HOSTNAME}/${RESET}"
	print_status "WARNING" "This is your last chance to verify everything and/or abort"
	prompt_confirm "Proceed?" || exit 0
	echo ""
}

stage3_confirmation() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 3 - Confirmation${RESET}"
	echo ""

	confirm_host
	confirm_disk
	confirm_disko
	confirm_final
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╻ ╻         ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┗━┫   ╺━╸   ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸     ╹         ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹
run_disko() {
	nix --experimental-features "nix-command flakes" \
		run github:nix-community/disko/latest -- \
		--mode destroy,format,mount \
		--yes-wipe-all-disks \
		--arg device '"'"${DISK}"'"' \
		"${SCRIPT_DIR}"/hosts/"${HOSTNAME}"/_disko.nix
}

regen_hwconfig() {
	nixos-generate-config --show-hardware-config --root /mnt |
		tee "${SCRIPT_DIR}"/hosts/"${HOSTNAME}"/_hardware-configuration.nix >/dev/null
}

install() {
	nixos-install \
		--no-root-password \
		--flake "${SCRIPT_DIR}"#"${HOSTNAME}"
}

set_passwords() {
	local username=$(get_username)
	nixos-enter --root /mnt -c "chpasswd" <<<"root:${ROOT_PASS}"
	nixos-enter --root /mnt -c "chpasswd" <<<"${username}:${USER_PASS}"
}

move_config() {
	local username=$(get_username)
	local target_dir="/mnt/home/${username}/nixorcism"
	mkdir -p "$target_dir"
	cp -rT "${SCRIPT_DIR}" "$target_dir"
	nixos-enter --root /mnt -c "chown -R ${username}:users /home/${username}/nixorcism"
}

stage4_installation() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 4 - Installation${RESET}"
	echo ""

	print_status "INFO" "Running disko..."
	run_disko
	echo ""

	print_status "INFO" "Regenerating hardware config..."
	regen_hwconfig
	echo ""

	print_status "INFO" "Installing NixOS..."
	install
	echo ""

	print_status "INFO" "Setting passwords..."
	set_passwords
	echo ""

	print_status "INFO" "Moving config..."
	move_config
	echo ""

	completion_banner
}

# ┏┳┓┏━┓╻┏┓╻
# ┃┃┃┣━┫┃┃┗┫
# ╹ ╹╹ ╹╹╹ ╹
stage1_checks
stage2_prompts
stage3_confirmation
stage4_installation
