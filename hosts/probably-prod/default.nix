{config, ...}: {
  flake.modules.nixos.probably-prod = {
    imports = with config.flake.modules.nixos; [
      # modules/desktop/
      display-managers'ly
      window-managers'sway

      # modules/programs/
      programs'cava
      programs'codex
      programs'fastfetch
      programs'git
      programs'helium
      programs'helix
      programs'nix-utils
      programs'opencode
      programs'openrgb
      programs'shell-utils
      programs'spicetify
      programs'vesktop

      # modules/services/
      services'glance
      services'udiskie

      # modules/shell/
      prompts'starship
      shells'fish

      # modules/system/
      system'bluetooth
      system'hardening

      # modules/theming/
      theming
    ];
  };
}
