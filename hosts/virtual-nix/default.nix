{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      # modules/desktop/
      desktop-environments'xfce
      desktop-extras'udiskie
      display-managers'gdm

      # modules/programs/
      programs'fastfetch
      programs'foot
      programs'git
      programs'helium
      programs'helix
      programs'keepassxc
      programs'nix-utils
      programs'opencode
      programs'shell-utils
      programs'spicetify

      # modules/services/
      services'syncthing

      # modules/shell/
      prompts'starship
      shells'fish
    ];
  };
}
