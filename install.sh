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
		formatter_status=" WARN "
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

# ┏━╸╻ ╻┏━╸┏━╸╻┏ ┏━┓
# ┃  ┣━┫┣╸ ┃  ┣┻┓┗━┓
# ┗━╸╹ ╹┗━╸┗━╸╹ ╹┗━┛
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

# ┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳╸┏━┓
# ┣━┛┣┳┛┃ ┃┃┃┃┣━┛ ┃ ┗━┓
# ╹  ╹┗╸┗━┛╹ ╹╹   ╹ ┗━┛
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
				print_status "INFO" "Hostname set to: ${HOSTNAME}"
				break
			fi
			;;
		esac

		print_status "FAILED" "Invalid choice"
	done
}
# ┏━╸┏━┓┏┓╻┏━╸╻┏━┓┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
# ┃  ┃ ┃┃┗┫┣╸ ┃┣┳┛┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━╸┗━┛╹ ╹╹  ╹╹┗╸╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
# confirm() {
# 	print_status "PROMPT" "Confirmation:"
# 	echo "Host is set to ${HOSTNAME}"
# 	# Correct host? >>
# 	# Have you checked the disko configuration? >>
# 	echo "This is the current state of the drives"
# 	lsblk -o NAME,SIZE,MODEL
# 	echo "Are you sure that disko won't f*ck something up?"

# 	echo "This will destroy all of the data on the target disk!"
# 	echo "Final question: continue installation?"
# }

confirm_host() {
	print_status "PROMPT" "Confirm the host:"
	echo "Host is currently set to ${HOSTNAME}"
	echo -ne "${DIM}└${RESET} Is that correct?: "
	# read -r choice
}

# ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━┓╺┳╸╻┏━┓┏┓╻
# ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹

# ┏━┓╻ ╻┏┓╻┏┓╻╻┏┓╻┏━╸
# ┣┳┛┃ ┃┃┗┫┃┗┫┃┃┗┫┃╺┓
# ╹┗╸┗━┛╹ ╹╹ ╹╹╹ ╹┗━┛
clear
print_banner
check_internet
check_git
echo ""
prompt_host
echo ""
confirm_host
