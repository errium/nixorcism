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

readonly CLR1="\033[0;35m"  # MAGENTA
readonly CLR1B="\033[1;35m" # BOLD_MAGENTA
readonly CLR2="\033[0;36m"  # CYAN
readonly CLR2B="\033[1;36m" # BOLD_CYAN

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

get_username() {
	awk -F: '$3 >= 1000 && $3 < 2000 {print $1; exit}' /mnt/etc/passwd
}

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

prompt_input() {
	local prompt="$1"
	local var_name="$2"
	local color="${3:-$DIM}"
	echo -ne "${color}>${RESET} ${BOLD}${prompt}${RESET}"
	read -r "$var_name"
}

prompt_confirm() {
	local prompt="$1"
	local color="${2:-$DIM}"
	while true; do
		read -p "$(echo -e "${color}>${RESET} ${BOLD}${prompt}${RESET} ${DIM}[y/n]${RESET}: ")" response
		case "$response" in
		y)
			return 0
			;;
		n)
			return 1
			;;
		*)
			print_status "FAILED" "Please type 'y' or 'n'"
			;;
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

finish_banner() {
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

stage1_checks() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 1 - Checks${RESET}"
	echo ""

	check_root
	check_internet

	echo "" && read -p "$(echo -e "${DIM}Press Enter to continue...${RESET}")"
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳╸┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┏━┛   ╺━╸   ┣━┛┣┳┛┃ ┃┃┃┃┣━┛ ┃ ┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━╸         ╹  ╹┗╸┗━┛╹ ╹╹   ╹ ┗━┛
# FIXIT
# Design inconsistency, lack of prompt
prompt_host() {
	local hosts_dir="${SCRIPT_DIR}/hosts"
	local hosts=()

	for dir in "$hosts_dir"/*; do
		if [[ -d "$dir" ]] && [[ -f "$dir/disko.nix" ]] && [[ -f "$dir/configuration.nix" ]]; then
			hosts+=("$(basename "$dir")")
		fi
	done

	if [[ ${#hosts[@]} -eq 0 ]]; then
		print_status "FAILED" "No host configurations found"
		exit 1
	fi

	print_status "PROMPT" "${BOLD}Choose a host${RESET}"
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

# TODO
# prompt_disk() and modifications to run_disko()

# FIXIT
# One of the passes applies twice
# Design inconsistency, fields are not bold
prompt_password() {
	local user_type="$1"
	local color="$2"
	local pass_var="$3"

	print_status "PROMPT" "Set password for ${user_type}"
	while true; do
		read -s -p "$(echo -e "${DIM}>${RESET} ${color}${user_type^}${RESET} password: ")" pass
		echo ""
		read -s -p "$(echo -e "${DIM}>${RESET} Confirm ${color}${user_type}${RESET} password: ")" pass_confirm
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
	prompt_password "root" "$CLR1" "ROOT_PASS"
	prompt_password "user" "$CLR2" "USER_PASS"

	read -p "$(echo -e "${DIM}Press Enter to continue...${RESET}")"
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━╸┏━┓┏┓╻┏━╸╻┏━┓┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ╺━┫   ╺━╸   ┃  ┃ ┃┃┗┫┣╸ ┃┣┳┛┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━┛         ┗━╸┗━┛╹ ╹╹  ╹╹┗╸╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
confirm_host() {
	print_status "PROMPT" "Confirm host configuration"
	echo -e "Selected host: ${CLR2}${HOSTNAME}${RESET}"

	prompt_confirm "Correct?" || exit 0
	echo ""
}

confirm_disko() {
	print_status "PROMPT" "Review disko configuration"
	echo -e "Disko config: ${CLR1}hosts/${HOSTNAME}/disko.nix${RESET}"
	echo -e "Verify the disk configuration before proceeding"

	prompt_confirm "Have you checked disko.nix?" || exit 1
	echo ""
}

confirm_disks() {
	print_status "INFO" "Current disk state:"
	lsblk -o NAME,SIZE,TYPE,MODEL
	print_status "WARNING" "All data on the target disk will be destroyed!"

	prompt_confirm "Correct disk target?" || exit 0
	echo ""
}

confirm_final() {
	print_status "PROMPT" "Final confirmation"
	echo -e "Ready to install:"
	echo -e "${DIM}-${RESET} Host: ${CLR2}${HOSTNAME}${RESET}"
	echo -e "${DIM}-${RESET} Config: ${CLR1}hosts/${HOSTNAME}/${RESET}"
	print_status "WARNING" "The target disk will be completely erased!"

	prompt_confirm "Proceed?" || exit 0
	echo ""
}

stage3_confirmation() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 3 - Confirmation${RESET}"
	echo ""

	confirm_host
	confirm_disko
	confirm_disks
	confirm_final
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╻ ╻         ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┗━┫   ╺━╸   ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸     ╹         ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹
run_disko() {
	# nix --experimental-features "nix-command flakes" \
	# 	run github:nix-community/disko/latest -- \
	# 	--mode destroy,format,mount \
	# 	${SCRIPT_DIR}/hosts/${HOSTNAME}/disko.nix \
	# 	--yes-wipe-all-disks
	echo "*run_disko*"
}

regen_hwconfig() {
	# nixos-generate-config --show-hardware-config --root /mnt |
	# 	tee ${SCRIPT_DIR}/hosts/${HOSTNAME}/hardware-configuration.nix >/dev/null
	echo "*regen_hwconfig*"
}

install() {
	# nixos-install \
	# 	--no-root-password \
	# 	--flake ${SCRIPT_DIR}#${HOSTNAME}
	echo "*install*"
}

set_passwords() {
	# local username=$(get_username)

	# nixos-enter --root /mnt -c "chpasswd" <<<"root:${ROOT_PASS}"
	# nixos-enter --root /mnt -c "chpasswd" <<<"${username}:${USER_PASS}"
	echo "*set_passwords*"
}

move_config() {
	# local username=$(get_username)
	# local target_dir="/mnt/home/${username}/nixorcism"

	# mkdir -p "$target_dir"
	# cp -rT "${SCRIPT_DIR}" "$target_dir"
	# nixos-enter --root /mnt -c "chown -R ${username}:users /home/${username}/nixorcism"
	echo "*move_config*"
}

# NOTE
# Maybe make it look cooler and show some info?
stage4_installation() {
	clear
	greeting_banner
	echo -e "${DIM}Stage 4 - Installation${RESET}"
	echo ""

	run_disko
	regen_hwconfig
	install
	set_passwords
	move_config
	finish_banner
}

# ┏┳┓┏━┓╻┏┓╻
# ┃┃┃┣━┫┃┃┗┫
# ╹ ╹╹ ╹╹╹ ╹
stage1_checks
stage2_prompts
stage3_confirmation
stage4_installation
