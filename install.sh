#!/usr/bin/env bash
set -euo pipefail

# ┏┓ ┏━┓┏┓╻┏┓╻┏━╸┏━┓
# ┣┻┓┣━┫┃┗┫┃┗┫┣╸ ┣┳┛
# ┗━┛╹ ╹╹ ╹╹ ╹┗━╸╹┗╸
print_banner() {
	local RESET="\033[0m"
	local WHITE="\033[0;37m"
	local DIM="\033[2m"
	local GRAY="\033[0;90m"

	local lines=(
		" ▐ ▄    ▐▄• ▄       ▄▄▄   ▄▄·    .▄▄ · • ▌ ▄ ·. "
		"•█▌▐███  █▌█▌       ▀▄ █·▐█ ▌ ██ ▐█ ▀. ·██ ▐███ "
		"▐█▐▐▌▐█· ·██·  ▄█▀▄ ▐▀▀▄ ██ ▄▄▐█·▄▀▀▀█▄▐█ ▌▐▌▐█·"
		"██▐█▌▐█▌ ▐█·█▌▐█▌.▐▌▐█•█▌▐███▌▐█▌▐█▄ ▐███ ██▌▐█▌"
		"▀▀ █ ▀▀▀•▀▀ ▀▀ ▀█▄▀ .▀  ▀·▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀  █ ▀▀▀"
		""
	)

	local grads=("$WHITE" "$WHITE" "$WHITE" "$DIM" "$GRAY" "$GRAY")
	for i in "${!lines[@]}"; do
		local clr=${grads[$((i % ${#grads[@]}))]}
		printf "%b%s%b\n" "$clr" "${lines[i]}" "$RESET"
	done
}

# ╻┏┓╻╺┳╸┏━╸┏━┓┏┓╻┏━╸╺┳╸
# ┃┃┗┫ ┃ ┣╸ ┣┳┛┃┗┫┣╸  ┃
# ╹╹ ╹ ╹ ┗━╸╹┗╸╹ ╹┗━╸ ╹
check_internet() {
	local RESET="\033[0m"
	local BOLD="\033[1m"
	local BOLD_RED="\033[1;31m"
	local BOLD_GREEN="\033[1;32m"

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
	local RESET="\033[0m"
	local BOLD="\033[1m"
	local BOLD_RED="\033[1;31m"
	local BOLD_GREEN="\033[1;32m"

	if which git >/dev/null 2>&1; then
		echo -e "${BOLD}[  ${BOLD_GREEN}OK${RESET}${BOLD}  ] Git is available"
	else
		echo -e "${BOLD}[${BOLD_RED}FAILED${RESET}] Git is not available"
		exit 1
	fi
}

# ┏━┓┏━┓┏━┓╺┳╸╻╺┳╸╻┏━┓┏┓╻╻┏┓╻┏━╸
# ┣━┛┣━┫┣┳┛ ┃ ┃ ┃ ┃┃ ┃┃┗┫┃┃┗┫┃╺┓
# ╹  ╹ ╹╹┗╸ ╹ ╹ ╹ ╹┗━┛╹ ╹╹╹ ╹┗━┛

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
