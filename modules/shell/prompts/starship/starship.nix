{
  flake.modules.nixos.programs'starship = {
    config,
    lib,
    ...
  }: {
    hj.rum.programs.starship = {
      enable = true;
      transience.enable = true;

      integrations = {
        fish.enable = config.hj.rum.programs.fish.enable;
        nushell.enable = config.hj.rum.programs.nushell.enable;
        zsh.enable = config.hj.rum.programs.zsh.enable;
      };
    };

    hj.rum.programs.starship.settings = let
      nfSymbols = lib.importTOML ./nf-symbols.toml;
    in (lib.recursiveUpdate nfSymbols {
      # ┏━╸┏━╸┏┓╻┏━╸┏━┓┏━┓╻
      # ┃╺┓┣╸ ┃┗┫┣╸ ┣┳┛┣━┫┃
      # ┗━┛┗━╸╹ ╹┗━╸╹┗╸╹ ╹┗━╸
      add_newline = true;
      continuation_prompt = "[·](dimmed)";
      format = lib.concatStrings [
        # Left
        ''[\$](bold purple)''
        "$directory"
        "$git_branch"
        "$git_status"
        "$git_state"

        # Right
        "$fill"
        "$nix_shell"
        "$cmd_duration"
        "$time"

        # 2nd line
        "$line_break"
        "$character"
      ];

      # ┏┳┓┏━┓╺┳┓╻ ╻╻  ┏━╸┏━┓
      # ┃┃┃┃ ┃ ┃┃┃ ┃┃  ┣╸ ┗━┓
      # ╹ ╹┗━┛╺┻┛┗━┛┗━╸┗━╸┗━┛
      directory = {
        format = " [·](dimmed) [$path]($style)[$read_only]($read_only_style) ";
        style = "bold cyan";
        read_only = " 󰌾";
        truncation_length = 1;
        truncation_symbol = "…/";
      };
      git_branch = {
        format = "[·](dimmed) [$branch(:$remote_branch)]($style) ";
        style = "bold purple";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold red";
        deleted = "x";
      };
      git_state = {
        format = "[·](dimmed) [$state( $progress_current/$progress_total)]($style)";
        style = "bold yellow";
        am = "am";
        am_or_rebase = "am/rebase";
        bisect = "bisecting";
        cherry_pick = "cherry-picking";
        merge = "merging";
        rebase = "rebasing";
        revert = "reverting";
      };
      fill = {
        style = "bright-black dimmed";
        symbol = "─";
      };
      nix_shell = {
        format = " [$symbol]($style) [·](dimmed)";
        symbol = "󱄅";
      };
      cmd_duration = {
        format = " [$duration]($style) [·](dimmed)";
        min_time = 5000;
        style = "bold white dimmed";
      };
      time = {
        disabled = false;
        format = " [$time]($style)";
        style = "bold white dimmed";
        time_format = "%R";
      };
      character = {
        error_symbol = ''[[└](bright-black dimmed) ✖](bold red)'';
        success_symbol = ''[[└](bright-black dimmed) ❯](bold green)'';
      };
    });
  };
}
