{
  flake.modules.nixos.programs'opencode = {
    config,
    pkgs,
    ...
  }: {
    hj.packages = with pkgs; [
      opencode
      opencode-desktop
    ];

    hj.xdg.config.files = {
      "opencode/opencode.jsonc".source = config.impureDir + "/opencode/opencode.jsonc";
      "opencode/AGENTS.md".source = config.impureDir + "/opencode/AGENTS.md";
      "opencode/commands/".source = config.impureDir + "/opencode/commands/";
    };

    nixorcism.preserve.user.directories = [
      ".cache/opencode"
      ".config/opencode"
      ".local/share/opencode"
      ".local/state/opencode"
    ];
  };
}
