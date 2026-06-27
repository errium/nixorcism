#!/usr/bin/env bash
set -euo pipefail

# ┏━╸╻  ┏━┓┏┓ ┏━┓╻     ╻ ╻┏━┓┏━┓┏━┓
# ┃╺┓┃  ┃ ┃┣┻┓┣━┫┃     ┃┏┛┣━┫┣┳┛┗━┓
# ┗━┛┗━╸┗━┛┗━┛╹ ╹┗━╸   ┗┛ ╹ ╹╹┗╸┗━┛
readonly B="\033[1m"    # Bold
readonly R="\033[1;31m" # Bold red
readonly Y="\033[1;33m" # Bold yellow
readonly G="\033[1;32m" # Bold green
readonly C="\033[1;36m" # Bold cyan
readonly M="\033[1;35m" # Bold magenta
readonly D="\033[2m"    # Dim
readonly RST="\033[0m"  # Reset

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
readonly SCRIPT_DIR

# ╻ ╻┏━╸╻  ┏━┓┏━╸┏━┓   ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓
# ┣━┫┣╸ ┃  ┣━┛┣╸ ┣┳┛   ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓
# ╹ ╹┗━╸┗━╸╹  ┗━╸╹┗╸   ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛
get_username() {
	awk -F: '$3 >= 1000 && $3 < 2000 {print $1; exit}' /mnt/etc/passwd
}

print_status() {
	local status="$1"
	local message="$2"
	local color icon

	case "$status" in
	"OK") color="$G" icon="*" ;;
	"WARNING") color="$Y" icon="!" ;;
	"FAILED") color="$R" icon="X" ;;
	"INFO") color="$C" icon="i" ;;
	"PROMPT") color="$M" icon="?" ;;
	*) color="$B" icon="$status" ;;
	esac

	echo -e "${color}${icon}${RST} ${D}|${RST} ${B}${message}${RST}"
}

input_prompt() {
	local prompt="$1"
	local var_name="$2"

	echo -ne "${M}>${RST} ${D}| ${prompt}${RST}"
	read -r "${var_name?}"
}

confirm_prompt() {
	local prompt="$1"

	while true; do
		echo -ne "${M}>${RST} ${D}| ${prompt} [y/n]:${RST} "
		read -r response
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
	echo -e "${B} ▄     ${RST}${D}▀▀${RST}${B}    ▄  ${RST}${D}      ▄          ${RST}${B}▀▀${RST}${D}       ▄       ${RST}"
	echo -e "${B} ████▄▀██▀  ██  ${RST}${D}▄███▄ ████▄▄███▀ ██ ▄██▀█ ███▄███▄${RST}"
	echo -e "${B} ██ ██ ██▀██████${RST}${D}██ ██ ██   ██    ██ ▀███▄ ██ ██ ██${RST}"
	echo -e "${B}▄██ ▀█▄██▄  ██  ${RST}${D}▀███▀▄█▀   ▀███▄▄███▄▄██▀▄██ ██ ██${RST}"
	echo -e "${B}            ▀   ${RST}${D}                                 ▀${RST}"
}

completion_banner() {
	echo ""
	echo -e "${B}    █▄                  ${RST} ${D}▄█${RST}"
	echo -e "${B}    ██       ▄          ${RST} ${D}██${RST}"
	echo -e "${B} ▄████ ▄███▄ ████▄ ▄█▀█▄${RST} ${D}██${RST}"
	echo -e "${B} ██ ██ ██ ██ ██ ██ ██▄█▀${RST}"
	echo -e "${B}▄█▀███▄▀███▀▄██ ▀█▄▀█▄▄▄${RST} ${D}██${RST}"
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
	echo -e "${D}Stage 1 - Checks${RST}" && echo ""

	check_root
	check_internet
	check_git

	echo "" && read -rp "$(echo -e "${D}Press Enter to continue...${RST}")"
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━┓┏━┓┏━┓┏┳┓┏━┓╺┳╸┏━┓
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┏━┛   ╺━╸   ┣━┛┣┳┛┃ ┃┃┃┃┣━┛ ┃ ┗━┓
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━╸         ╹  ╹┗╸┗━┛╹ ╹╹   ╹ ┗━┛
prompt_host() {
	# NOTE: Required files for a valid host are hardcoded here,
	# as I'll never need these to be anything else.
	local required_files=("configuration.nix" "disko.nix" "_hardware.nix")
	local hosts_dir="${SCRIPT_DIR}/hosts"
	local hosts=()
	local choice

	# Collect hosts that have all required files.
	for dir in "$hosts_dir"/*/; do
		[[ -d "$dir" ]] || continue
		local valid=true
		for file in "${required_files[@]}"; do
			[[ -f "${dir}${file}" ]] || {
				valid=false
				break
			}
		done
		$valid && hosts+=("$(basename "$dir")")
	done

	if [[ ${#hosts[@]} -eq 0 ]]; then
		print_status "FAILED" "No valid host configurations found"
		exit 1
	fi

	# Print numbered list and prompt for choice.
	print_status "PROMPT" "Available hosts:"
	for i in "${!hosts[@]}"; do
		echo -e "${B}$((i + 1))${RST} ${D}|${RST} ${hosts[i]}"
	done

	while true; do
		input_prompt "Pick one: " choice
		if [[ "$choice" =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= ${#hosts[@]})); then
			HOSTNAME="${hosts[choice - 1]}"
			break
		fi
		print_status "FAILED" "Invalid choice"
	done
}

prompt_password() {
	local var_name="$1"
	local pass confirm

	# No input_prompt here, because I want the passwords to be invisible.
	while true; do
		echo -ne "${M}>${RST} ${D}| Enter:${RST} "
		read -rs pass
		echo ""

		echo -ne "${M}>${RST} ${D}| Confirm:${RST} "
		read -rs confirm
		echo ""

		if [[ "$pass" == "$confirm" ]]; then
			printf -v "$var_name" '%s' "$pass"
			break
		fi

		print_status "FAILED" "Passwords do not match, try again"
	done
}

stage2_prompts() {
	clear
	greeting_banner
	echo -e "${D}Stage 2 - Prompts${RST}" && echo ""

	prompt_host && echo ""
	print_status "PROMPT" "Password for user:"
	prompt_password USER_PASS && echo ""
	print_status "PROMPT" "Password for root:"
	prompt_password ROOT_PASS

	echo "" && read -rp "$(echo -e "${D}Press Enter to continue...${RST}")"
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ┏━┓         ┏━╸┏━┓┏┓╻┏━╸╻┏━┓┏┳┓┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ╺━┫   ╺━╸   ┃  ┃ ┃┃┗┫┣╸ ┃┣┳┛┃┃┃┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸   ┗━┛         ┗━╸┗━┛╹ ╹╹  ╹╹┗╸╹ ╹╹ ╹ ╹ ╹┗━┛╹ ╹
confirm_host() {
	print_status "INFO" "Selected host: ${RST}${HOSTNAME}"
	confirm_prompt "Correct?" || exit 0
}

confirm_final() {
	print_status "WARNING" "This will format the disk and install NixOS"
	print_status "INFO" "This is your last chance to abort"
	confirm_prompt "Proceed?" || exit 0
}

stage3_confirmation() {
	clear
	greeting_banner
	echo -e "${D}Stage 3 - Confirmation${RST}" && echo ""

	confirm_host && echo ""
	confirm_final
}

# ┏━┓╺┳╸┏━┓┏━╸┏━╸   ╻ ╻         ╻┏┓╻┏━┓╺┳╸┏━┓╻  ╻  ┏━┓╺┳╸╻┏━┓┏┓╻
# ┗━┓ ┃ ┣━┫┃╺┓┣╸    ┗━┫   ╺━╸   ┃┃┗┫┗━┓ ┃ ┣━┫┃  ┃  ┣━┫ ┃ ┃┃ ┃┃┗┫
# ┗━┛ ╹ ╹ ╹┗━┛┗━╸     ╹         ╹╹ ╹┗━┛ ╹ ╹ ╹┗━╸┗━╸╹ ╹ ╹ ╹┗━┛╹ ╹
run_disko() {
	NIX_CONFIG="extra-experimental-features = nix-command flakes pipe-operators" \
		nix run github:nix-community/disko/latest -- \
		--mode destroy,format,mount \
		--yes-wipe-all-disks \
		--flake "${SCRIPT_DIR}"#"${HOSTNAME}"
}

regen_hwconfig() {
	nixos-generate-config \
		--show-hardware-config \
		--no-filesystems \
		--root /mnt |
		tee "${SCRIPT_DIR}/hosts/${HOSTNAME}/_hardware.nix" >/dev/null
}

write_passwords() {
	local username
	username=$(get_username)

	# /persistent is hardcoded - I'll never use anything else
	local pass_dir
	if mountpoint -q "/mnt/persistent"; then
		pass_dir="/mnt/persistent/etc/passwords"
	else
		pass_dir="/mnt/etc/passwords"
	fi

	mkdir -p "$pass_dir"
	chmod 700 "$pass_dir"

	echo "$USER_PASS" | mkpasswd -s >"${pass_dir}/${username}"
	echo "$ROOT_PASS" | mkpasswd -s >"${pass_dir}/root"

	chmod 600 "${pass_dir}/${username}" "${pass_dir}/root"
}

install() {
	NIX_CONFIG="extra-experimental-features = nix-command flakes pipe-operators" \
		nixos-install \
		--no-root-password \
		--flake "${SCRIPT_DIR}"#"${HOSTNAME}"
}

copy_config() {
	local username
	username=$(get_username)

	# /persistent and nixorcism dir name are hardcoded - I'll never use anything else
	local target
	if mountpoint -q "/mnt/persistent"; then
		target="/mnt/persistent/home/${username}/nixorcism"
	else
		target="/mnt/home/${username}/nixorcism"
	fi

	mkdir -p "$target"
	cp -rT "${SCRIPT_DIR}" "$target"
	nixos-enter --root /mnt -c "chown -R ${username}:users /home/${username}/nixorcism"
}

stage4_installation() {
	clear
	greeting_banner
	echo -e "${D}Stage 4 - Installation${RST}" && echo ""

	print_status "INFO" "Running disko..."
	run_disko && print_status "OK" "Disko done"

	print_status "INFO" "Regenerating hardware config..."
	regen_hwconfig && print_status "OK" "Regeneration done"

	print_status "INFO" "Writing passwords..."
	write_passwords && print_status "OK" "Passwords written"

	print_status "INFO" "Installing NixOS..."
	install && print_status "OK" "NixOS installed"

	print_status "INFO" "Copying config..."
	copy_config && print_status "OK" "Config copied"

	completion_banner
}

# ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻   ┏━╸┏━┓╻  ╻  ┏━┓
# ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫   ┃  ┣━┫┃  ┃  ┗━┓
# ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹   ┗━╸╹ ╹┗━╸┗━╸┗━┛
stage1_checks
stage2_prompts
stage3_confirmation
stage4_installation
