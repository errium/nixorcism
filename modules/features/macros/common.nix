{
  # NOTE: `macros_common` is NOT meant to be imported manually
  flake.modules.nixos.macros_common = {username, ...}: {
    programs.ydotool = {
      enable = true;
      group = "ydotool";
    };
    users.groups.ydotool.members = [username];
  };

  # AI slop function
  flake.lib.mkMacro = {
    pkgs,
    lib,
  }: name: steps: let
    bold = "\\033[1m";
    green = "\\033[1;32m";
    cyan = "\\033[1;36m";
    blue = "\\033[1;34m";
    reset = "\\033[0m";
  in
    pkgs.writeShellScriptBin name ''
      set -euo pipefail
      ${lib.concatMapStringsSep "\n" (
          step:
            lib.concatStringsSep "\n" (
              # Press a button if specified
              lib.optionals (step ? key) [
                "echo -e \"[  ${green}KEY${reset}  ] ${bold}${step.key}${reset}\""
                "ydotool key ${step.key}"
              ]
              # Delay + click if `clickWithDelay` specified
              ++ lib.optionals (step ? clickWithDelay) [
                "echo -e \"[ ${cyan}CLICK${reset} ] ${bold}${toString step.clickWithDelay}ms delay${reset}\""
                "sleep 0.${toString step.clickWithDelay}"
                "ydotool click 0xC0"
              ]
              # Random delay before the next step
              # RANDOM % (max - min + 1) + min
              ++ lib.optionals (step ? minDelay) [
                ''
                  _delay=$(( RANDOM % (${toString step.maxDelay} - ${toString step.minDelay} + 1) + ${toString step.minDelay} ))
                  echo -e "[ ${blue}SLEEP${reset} ] ${bold}for ''${_delay}ms${reset}"
                  sleep 0.''${_delay}
                ''
              ]
            )
        )
        steps}
    '';
}
