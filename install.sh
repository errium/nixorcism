#!/usr/bin/env bash
set -euo pipefail

# ┏━╸╻  ┏━┓┏┓ ┏━┓╻  ┏━┓
# ┃╺┓┃  ┃ ┃┣┻┓┣━┫┃  ┗━┓
# ┗━┛┗━╸┗━┛┗━┛╹ ╹┗━╸┗━┛
RESET="\033[0m"
WHITE="\033[0;37m"
BOLD="\033[1m"
DIM="\033[2m"
GRAY="\033[0;90m"
BOLD_RED="\033[1;31m"
BOLD_GREEN="\033[1;32m"
BOLD_BLUE="\033[1;34m"
BOLD_YELLOW="\033[1;33m"
BOLD_MAGENTA="\033[1;35m"

print_status() {
	local status="$1"
	local message="$2"
	local color
	local formatted_status

	case "$status" in
	"OK")
		color="$BOLD_GREEN"
		formatted_status="  OK  "
		;;
	"WARN")
		color="$BOLD_YELLOW"
		formatted_status=" WARN "
		;;
	"FAILED")
		color="$BOLD_RED"
		formatted_status="FAILED"
		;;
	"INFO")
		color="$BOLD_YELLOW"
		formatted_status=" INFO "
		;;
	"PROMPT")
		color="$BOLD_MAGENTA"
		formatted_status="PROMPT"
		;;
	*)
		color="$BOLD"
		formatted_status="$status"
		;;
	esac

	echo -e "${DIM}[${RESET}${color}${formatted_status}${RESET}${DIM}]${RESET} ${message}"
}

# ┏┓ ┏━┓┏┓╻┏┓╻┏━╸┏━┓
# ┣┻┓┣━┫┃┗┫┃┗┫┣╸ ┣┳┛
# ┗━┛╹ ╹╹ ╹╹ ╹┗━╸╹┗╸
print_banner() {
	local lines=(
		" ▐ ▄    ▐▄• ▄       ▄▄▄   ▄▄·    .▄▄ · • ▌ ▄ ·. "
		"•█▌▐███  █▌█▌       ▀▄ █·▐█ ▌ ██ ▐█ ▀. ·██ ▐███ "
		"▐█▐▐▌▐█· ·██·  ▄█▀▄ ▐▀▀▄ ██ ▄▄▐█·▄▀▀▀█▄▐█ ▌▐▌▐█·"
		"██▐█▌▐█▌ ▐█·█▌▐█▌.▐▌▐█•█▌▐███▌▐█▌▐█▄ ▐███ ██▌▐█▌"
		"▀▀ █ ▀▀▀•▀▀ ▀▀ ▀█▄▀ .▀  ▀·▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀  █ ▀▀▀"
		""
	)

	local grads=("$BOLD" "$WHITE" "$WHITE" "$DIM" "$GRAY" "$GRAY")
	for i in "${!lines[@]}"; do
		local clr=${grads[$((i % ${#grads[@]}))]}
		printf "%b%s%b\n" "$clr" "${lines[i]}" "$RESET"
	done
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╺┓          ┏━╸╻ ╻┏━╸┏━╸╻┏ ┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸     ┃    ╺━╸   ┃  ┣━┫┣╸ ┃  ┣┻┓┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ╺┻╸         ┗━╸╹ ╹┗━╸┗━╸╹ ╹┗━┛
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

# Running
clear
print_banner
echo "<< Stage 1 - Checks >>"
echo ""
check_internet
check_git

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳╸┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┏━┛   ╺━╸   ┣━┛┣┳┛┃ ┃┃┃┃┣━┛ ┃ ┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━╸         ╹  ╹┗╸┗━┛╹ ╹╹   ╹ ┗━┛
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

	print_status "PROMPT" "Available hosts:"
	for i in "${!hosts[@]}"; do
		echo -e "${BOLD_MAGENTA}$((i + 1))${RESET} ${hosts[i]}"
	done

	while true; do
		echo -ne "${DIM}└${RESET} Choose a host ${DIM}(1-${#hosts[@]})${RESET}: "
		read -r choice

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
clear
print_banner
echo "<< Stage 2 - Prompts >>"
echo ""
prompt_host

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━╸┏━┓┏┓╻┏━╸╻┏━┓┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ╺━┫   ╺━╸   ┃  ┃ ┃┃┗┫┣╸ ┃┣┳┛┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━┛         ┗━╸┗━┛╹ ╹╹  ╹╹┗╸╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
confirm_host() {
	print_status "PROMPT" "Confirm host configuration"
	echo -e "Selected host: ${BOLD_BLUE}${HOSTNAME}${RESET}"

	while true; do
		read -p "$(echo -e "${DIM}└${RESET} Is this correct? (yes/no): ")" response

		case "$response" in
		yes)
			print_status "OK" "Host confirmed"
			break
			;;
		no)
			print_status "FAILED" "Host selection aborted"
			exit 0
			;;
		*)
			print_status "FAILED" "Please type 'yes' or 'no'"
			;;
		esac
	done
	echo ""
}

confirm_disko() {
	print_status "PROMPT" "Review disko configuration"
	echo -e "${DIM}Disko config location: ${RESET}hosts/${HOSTNAME}/disko.nix"
	echo -e "${BOLD}Please verify the disk configuration before proceeding.${RESET}"

	while true; do
		read -p "$(echo -e "${DIM}└${RESET} Have you checked the disko.nix file? (yes/no): ")" response

		case "$response" in
		yes)
			print_status "OK" "Disko configuration acknowledged"
			break
			;;
		no)
			print_status "INFO" "Please review hosts/${HOSTNAME}/disko.nix before continuing"
			exit 1
			;;
		*)
			print_status "FAILED" "Please type 'yes' or 'no'"
			;;
		esac
	done
	echo ""
}

confirm_disks() {
	print_status "INFO" "Current disk state:"
	lsblk -o NAME,SIZE,TYPE,MODEL
	# echo -e "${BOLD_RED}⚠️  WARNING: Disko will format the target disk!${RESET}"
	# echo -e "${BOLD_RED}⚠️  ALL DATA on the target disk WILL BE DESTROYED!${RESET}"

	while true; do
		read -p "$(echo -e "${DIM}└${RESET} Are you sure the disko config targets the correct disk? (yes/no): ")" response

		case "$response" in
		yes)
			print_status "OK" "Disk configuration confirmed"
			break
			;;
		no)
			print_status "FAILED" "Installation aborted - please fix disko.nix"
			exit 0
			;;
		*)
			print_status "FAILED" "Please type 'yes' or 'no'"
			;;
		esac
	done
	echo ""
}

confirm_final() {
	print_status "PROMPT" "Final confirmation"
	echo -e "${BOLD}Ready to install:${RESET}"
	echo -e " - Host: ${BOLD_BLUE}${HOSTNAME}${RESET}"
	echo -e " - Config: ${DIM}hosts/${HOSTNAME}/${RESET}"
	# echo -e "${BOLD_RED}⚠️  This is your last chance to abort!${RESET}"
	# echo -e "${BOLD_RED}⚠️  The target disk will be completely erased!${RESET}"

	while true; do
		read -p "$(echo -e "${BOLD}Continue with installation? (yes/no): ${RESET}")" response

		case "$response" in
		yes)
			print_status "OK" "Starting installation"
			break
			;;
		no)
			print_status "FAILED" "Installation aborted by user"
			exit 0
			;;
		*)
			print_status "FAILED" "Please type 'yes' or 'no'"
			;;
		esac
	done
	echo ""
}

clear
print_banner
echo "<< Stage 3 - Confirmation >>"
echo ""
confirm_host
confirm_disko
confirm_disks
confirm_final
