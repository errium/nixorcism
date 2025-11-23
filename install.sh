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

# ╻┏┓╻╺┳╸┏━╸┏━┓┏┓╻┏━╸╺┳╸
# ┃┃┗┫ ┃ ┣╸ ┣┳┛┃┗┫┣╸  ┃
# ╹╹ ╹ ╹ ┗━╸╹┗╸╹ ╹┗━╸ ╹
check_internet() {
	if ping -c 1 nixos.org >/dev/null 2>&1; then
		echo -e "${BOLD}[  ${BOLD_GREEN}OK${RESET}${BOLD}  ] Internet is up"
	else
		echo -e "${BOLD}[${BOLD_RED}FAILED${RESET}${BOLD}] No internet connection"
		exit 1
	fi
}

# ┏━╸╻╺┳╸
# ┃╺┓┃ ┃
# ┗━┛╹ ╹
check_git() {
	if which git >/dev/null 2>&1; then
		echo -e "${BOLD}[  ${BOLD_GREEN}OK${RESET}${BOLD}  ] Git is available"
	else
		echo -e "${BOLD}[${BOLD_RED}FAILED${RESET}${BOLD}] Git is not available"
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
		if [[ -d "$dir" ]] && [[ -f "$dir/configuration.nix" ]]; then
			hosts+=("$(basename "$dir")")
		fi
	done

	if [[ ${#hosts[@]} -eq 0 ]]; then
		echo -e "${BOLD}[${BOLD_RED}FAILED${RESET}${BOLD}] No host configurations found"
		exit 1
	fi

	echo -e "${BOLD}[${BOLD_MAGENTA}PROMPT${RESET}${BOLD}] Select hostname:"
	for i in "${!hosts[@]}"; do
		echo -e "$((i + 1)) - ${hosts[i]}"
	done

	while true; do
		echo -e "${BOLD}Enter choice (1-${#hosts[@]}):${RESET}"
		read -r choice

		case "$choice" in
		[0-9]*)
			if ((choice >= 1 && choice <= ${#hosts[@]})); then
				HOSTNAME="${hosts[choice - 1]}"
				echo -e "${BOLD}[  ${BOLD_GREEN}OK${RESET}${BOLD}  ] Hostname set to: ${BOLD_MAGENTA}${HOSTNAME}"
				break
			fi
			;;
		esac

		echo -e "${BOLD}[${BOLD_RED}FAILED${RESET}${BOLD}] Invalid choice"
	done
}

# ┏━┓┏━┓┏━┓╺┳╸╻╺┳╸╻┏━┓┏┓╻╻┏┓╻┏━╸
# ┣━┛┣━┫┣┳┛ ┃ ┃ ┃ ┃┃ ┃┃┗┫┃┃┗┫┃╺┓
# ╹  ╹ ╹╹┗╸ ╹ ╹ ╹ ╹┗━┛╹ ╹╹╹ ╹┗━┛

# ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━┓╺┳╸╻┏━┓┏┓╻
# ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹

# regen_hwconfig() {
# 	nixos-generate-config --show-hardware-config >/mnt/etc/nixos/hosts/virtual-nix/hardware-configuration.nix
# }

# ┏━┓╻ ╻┏┓╻┏┓╻╻┏┓╻┏━╸
# ┣┳┛┃ ┃┃┗┫┃┗┫┃┃┗┫┃╺┓
# ╹┗╸┗━┛╹ ╹╹ ╹╹╹ ╹┗━┛
clear
print_banner
check_internet
check_git
prompt_host
