#!/usr/bin/env bash
set -eu

# ┏┓ ┏━┓┏┓╻┏┓╻┏━╸┏━┓   ┏╸╻ ╻╺┓
# ┣┻┓┣━┫┃┗┫┃┗┫┣╸ ┣┳┛   ┃ ┣━┫ ┃
# ┗━┛╹ ╹╹ ╹╹ ╹┗━╸╹┗╸   ┗╸╹ ╹╺┛
print_banner_halves() {
	local RESET="\033[0m"
	local WHITE="\033[0;37m"
	local DIM="\033[2m"
	local GRAY="\033[0;90m"

	local lines=(
		"${DIM} ▐ ▄    ▐▄• ▄ ${WHITE}      ▄▄▄   ▄▄·    .▄▄ · • ▌ ▄ ·. ${RESET}"
		"${DIM}•█▌▐███  █▌█▌ ${WHITE}      ▀▄ █·▐█ ▌ ██ ▐█ ▀. ·██ ▐███ ${RESET}"
		"${DIM}▐█▐▐▌▐█· ·██· ${WHITE} ▄█▀▄ ▐▀▀▄ ██ ▄▄▐█·▄▀▀▀█▄▐█ ▌▐▌▐█·${RESET}"
		"${DIM}██▐█▌▐█▌ ▐█·█▌${WHITE}▐█▌.▐▌▐█•█▌▐███▌▐█▌▐█▄ ▐███ ██▌▐█▌${RESET}"
		"${DIM}▀▀ █ ▀▀▀•▀▀ ▀▀${WHITE} ▀█▄▀ .▀  ▀·▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀  █ ▀▀▀${RESET}"
	)

	for i in "${!lines[@]}"; do
		printf "%b%s%b\n" "${lines[i]}"
	done
}

# ┏┓ ┏━┓┏┓╻┏┓╻┏━╸┏━┓   ┏╸┏━╸╺┓
# ┣┻┓┣━┫┃┗┫┃┗┫┣╸ ┣┳┛   ┃ ┃╺┓ ┃
# ┗━┛╹ ╹╹ ╹╹ ╹┗━╸╹┗╸   ┗╸┗━┛╺┛
print_banner_grads() {
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
	)

	local grads=("$WHITE" "$WHITE" "$DIM" "$GRAY" "$GRAY" "$GRAY")
	for i in "${!lines[@]}"; do
		local clr=${grads[$((i % ${#grads[@]}))]}
		printf "%b%s%b\n" "$clr" "${lines[i]}" "$RESET"
	done
}

# ┏━┓╻ ╻┏┓╻
# ┣┳┛┃ ┃┃┗┫
# ╹┗╸┗━┛╹ ╹
clear

banner_choice=$((RANDOM % 2 + 1))
case $banner_choice in
1) print_banner_halves ;;
2) print_banner_grads ;;
esac
