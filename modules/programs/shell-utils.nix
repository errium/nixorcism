{
  flake.modules.nixos.programs'shell-utils = {
    config,
    lib,
    pkgs,
    ...
  }: let
    # eza has no config file (only flags and env), so the defaults are baked
    # into a wrapper: they apply everywhere, not just through aliases
    ezaFlags =
      [
        "--color=auto"
        "--group-directories-first"
        "--header"
        "--icons=auto"
      ]
      |> lib.concatStringsSep " ";

    eza = pkgs.symlinkJoin {
      name = "eza";
      paths = [pkgs.eza];
      meta.mainProgram = "eza";
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = ''wrapProgram $out/bin/eza --add-flags "${ezaFlags}"'';
    };
  in {
    hj.packages =
      [eza]
      ++ (with pkgs; [
        bat
        btop
        dysk
        fd
        ripgrep
      ]);

    # btop
    hj.xdg.config.files."btop/btop.conf".text = ''
      color_theme = "TTY"
      rounded_corners = False
      theme_background = False
      update_ms = 200
    '';

    # eza
    nixorcism.shellAliases = lib.mkMerge [
      {
        ll = "eza -lh";
        lla = "eza -lah";
        lt = "eza -lhT";
        lta = "eza -lahT";
        tree = "eza -T";
      }
      (lib.mkIf config.hj.rum.programs.git.enable {
        llg = "eza -lh --git";
        ltg = "eza -lhT --git";
      })
    ];

    # fzf
    hj.rum.programs.fzf = {
      enable = true;
      integrations.fish.enable = config.hj.rum.programs.fish.enable;
      integrations.zsh.enable = config.hj.rum.programs.zsh.enable;
    };

    # zoxide
    hj.rum.programs.zoxide = {
      enable = true;
      integrations.fish.enable = config.hj.rum.programs.fish.enable;
      integrations.nushell.enable = config.hj.rum.programs.nushell.enable;
      integrations.zsh.enable = config.hj.rum.programs.zsh.enable;
      flags = ["--cmd cd"];
    };

    nixorcism.preserve.user.directories = [".local/share/zoxide"];
  };
}
