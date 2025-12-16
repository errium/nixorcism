#!/usr/bin/env bash
set -euo pipefail

# ┏━╸╻  ┏━┓┏┓ ┏━┓╻  ┏━┓
# ┃╺┓┃  ┃ ┃┣┻┓┣━┫┃  ┗━┓
# ┗━┛┗━╸┗━┛┗━┛╹ ╹┗━╸┗━┛
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

readonly RESET="\033[0m"
readonly WHITE="\033[0;37m"
readonly BOLD="\033[1m"
readonly DIM="\033[2m"
readonly BOLD_RED="\033[1;31m"
readonly BOLD_YELLOW="\033[1;33m"
readonly BOLD_BLUE="\033[1;34m"
readonly BOLD_CYAN="\033[1;36m"

print_status() {
	local status="$1"
	local message="$2"
	local color
	local icon
	case "$status" in
	"OK")
		color="$BOLD_CYAN"
		icon="*"
		;;
	"WARN")
		color="$BOLD_YELLOW"
		icon="!"
		;;
	"FAILED")
		color="$BOLD_RED"
		icon="X"
		;;
	"INFO")
		color="$BOLD_BLUE"
		icon="ℹ"
		;;
	"PROMPT")
		color="$BOLD_BLUE"
		icon="?"
		;;
	*)
		color="$BOLD"
		icon="$status"
		;;
	esac
	echo -e "${color}${icon}${RESET} ${message}"
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
		read -p "$(echo -e "${color}>${RESET} ${BOLD}${prompt}${RESET} ${DIM}(yes/no)${RESET}: ")" response
		case "$response" in
		yes)
			return 0
			;;
		no)
			return 1
			;;
		*)
			print_status "FAILED" "Please type 'yes' or 'no'"
			;;
		esac
	done
}

# ┏┓ ┏━┓┏┓╻┏┓╻┏━╸┏━┓┏━┓
# ┣┻┓┣━┫┃┗┫┃┗┫┣╸ ┣┳┛┗━┓
# ┗━┛╹ ╹╹ ╹╹ ╹┗━╸╹┗╸┗━┛
greeting_banner() {
	local lines=(
		"▄▄  ▄▄ ▄▄ ▄▄ ▄▄  ▄▄▄  ▄▄▄▄   ▄▄▄▄ ▄▄  ▄▄▄▄ ▄▄   ▄▄ "
		"███▄██ ██ ▀█▄█▀ ██▀██ ██▄█▄ ██▀▀▀ ██ ███▄▄ ██▀▄▀██ "
		"██ ▀██ ██ ██ ██ ▀███▀ ██ ██ ▀████ ██ ▄▄██▀ ██   ██ "
		""
	)

	local grads=("$BOLD" "$BOLD_BLUE" "$BOLD_CYAN" "$WHITE" "$WHITE" "$WHITE")
	for i in "${!lines[@]}"; do
		local clr=${grads[$((i % ${#grads[@]}))]}
		printf "%b%s%b\n" "$clr" "${lines[i]}" "$RESET"
	done
}

finish_banner() {
	local lines=(
		""
		"▄▄▄▄   ▄▄▄  ▄▄  ▄▄ ▄▄▄▄▄  ██ "
		"██▀██ ██▀██ ███▄██ ██▄▄   ██ "
		"████▀ ▀███▀ ██ ▀██ ██▄▄▄  ▄▄ "
		""
	)

	local grads=("$BOLD" "$BOLD" "$BOLD_BLUE" "$BOLD_CYAN")
	for i in "${!lines[@]}"; do
		local clr=${grads[$((i % ${#grads[@]}))]}
		printf "%b%s%b\n" "$clr" "${lines[i]}" "$RESET"
	done
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╺┓          ┏━╸╻ ╻┏━╸┏━╸╻┏ ┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸     ┃    ╺━╸   ┃  ┣━┫┣╸ ┃  ┣┻┓┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ╺┻╸         ┗━╸╹ ╹┗━╸┗━╸╹ ╹┗━┛
clear
greeting_banner
echo -e "${DIM}Stage 1 * Checks${RESET}"
echo ""

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

# Running
check_root
check_internet

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳╸┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┏━┛   ╺━╸   ┣━┛┣┳┛┃ ┃┃┃┃┣━┛ ┃ ┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━╸         ╹  ╹┗╸┗━┛╹ ╹╹   ╹ ┗━┛
echo ""
echo -e "${DIM}Stage 2 * Prompts${RESET}"
echo ""

prompt_host() {
	local hosts_dir="hosts"
	local hosts=()

	for dir in "$hosts_dir"/*; do
		if [[ -d "$dir" ]] && [[ -f "$dir/disko.nix" ]]; then
			hosts+=("$(basename "$dir")")
		fi
	done

	if [[ ${#hosts[@]} -eq 0 ]]; then
		print_status "FAILED" "No host configurations found"
		exit 1
	fi

	print_status "PROMPT" "${BOLD}Choose a host${RESET}"
	for i in "${!hosts[@]}"; do
		echo -e "  ${DIM}$((i + 1))${RESET} ${hosts[i]}"
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
}

# Running
prompt_host

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━╸┏━┓┏┓╻┏━╸╻┏━┓┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ╺━┫   ╺━╸   ┃  ┃ ┃┃┗┫┣╸ ┃┣┳┛┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━┛         ┗━╸┗━┛╹ ╹╹  ╹╹┗╸╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
clear
greeting_banner
echo -e "${DIM}Stage 3 * Confirmation${RESET}"
echo ""

confirm_host() {
	print_status "PROMPT" "${BOLD}Confirm host configuration${RESET}"
	echo -e "Selected host: ${BOLD_BLUE}${HOSTNAME}${RESET}"

	if prompt_confirm "Correct?"; then
		print_status "OK" "Host confirmed"
	else
		print_status "FAILED" "Host selection aborted"
		exit 0
	fi
	echo ""
}

confirm_disko() {
	print_status "PROMPT" "${BOLD}Review disko configuration${RESET}"
	echo -e "Disko config location: ${BOLD_CYAN}hosts/${HOSTNAME}/disko.nix${RESET}"
	echo -e "Please verify the disk configuration before proceeding!"

	if prompt_confirm "Have you checked the disko.nix file?"; then
		print_status "OK" "Disko configuration acknowledged"
	else
		print_status "INFO" "Please review ${BOLD_CYAN}hosts/${HOSTNAME}/disko.nix${RESET} before continuing"
		exit 1
	fi
	echo ""
}

confirm_disks() {
	print_status "INFO" "${BOLD}Current disk state:${RESET}"
	lsblk -o NAME,SIZE,TYPE,MODEL
	print_status "WARN" "Disko will format the target disk!"
	print_status "WARN" "All data on the target disk will be destroyed!"

	if prompt_confirm "Correct disk target?"; then
		print_status "OK" "Disk configuration confirmed"
	else
		print_status "FAILED" "Installation aborted - please fix disko.nix"
		exit 0
	fi
	echo ""
}

confirm_final() {
	print_status "PROMPT" "${BOLD}Final confirmation${RESET}"
	echo -e "Ready to install:"
	echo -e " - Host: ${BOLD_BLUE}${HOSTNAME}${RESET}"
	echo -e " - Config path: ${BOLD_CYAN}hosts/${HOSTNAME}/${RESET}"
	print_status "WARN" "This is your last chance to abort!"
	print_status "WARN" "The target disk will be completely erased!"

	if prompt_confirm "Proceed?"; then
		print_status "OK" "Starting installation"
	else
		print_status "FAILED" "Installation aborted by user"
		exit 0
	fi
	echo ""
}

confirm_host
confirm_disko
confirm_disks
confirm_final

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╻ ╻         ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┗━┫   ╺━╸   ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸     ╹         ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹
run_disko() {
	nix --experimental-features "nix-command flakes" \
		run github:nix-community/disko/latest -- \
		--mode destroy,format,mount \
		${SCRIPT_DIR}/hosts/${HOSTNAME}/disko.nix \
		--yes-wipe-all-disks
}

regen_hwconfig() {
	nixos-generate-config --show-hardware-config --root /mnt |
		tee ${SCRIPT_DIR}/hosts/${HOSTNAME}/hardware-configuration.nix >/dev/null
}

install() {
	nixos-install \
		--no-root-password \
		--flake ${SCRIPT_DIR}#${HOSTNAME}
}

move_config() {
	local username=$(awk -F: '$3 >= 1000 && $3 < 2000 {print $1; exit}' /mnt/etc/passwd)
	local target_dir="/mnt/home/${username}/nixorcism"

	mkdir -p "$target_dir"
	cp -rT "${SCRIPT_DIR}" "$target_dir"
	nixos-enter --root /mnt -c "chown -R ${username}:users /home/${username}/nixorcism"
}

run_disko
regen_hwconfig
install
move_config
finish_banner
