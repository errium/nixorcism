{
  flake.modules.nixos.prompts'starship = {
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

    hj.rum.programs.starship.settings = {
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

      # ┏┓╻┏━╸   ┏━┓┏━┓┏━╸┏━┓┏━╸╺┳╸
      # ┃┗┫┣╸    ┣━┛┣┳┛┣╸ ┗━┓┣╸  ┃
      # ╹ ╹╹     ╹  ╹┗╸┗━╸┗━┛┗━╸ ╹
      aws.symbol = " ";
      azure.symbol = " ";
      battery = {
        full_symbol = "󰁹 ";
        charging_symbol = "󰂄 ";
        discharging_symbol = "󰂃 ";
        unknown_symbol = "󰂑 ";
        empty_symbol = "󰂎 ";
      };
      buf.symbol = " ";
      bun.symbol = " ";
      c.symbol = " ";
      cpp.symbol = " ";
      cmake.symbol = " ";
      cobol.symbol = " ";
      conda.symbol = " ";
      container.symbol = " ";
      crystal.symbol = " ";
      dart.symbol = " ";
      deno.symbol = " ";
      direnv.symbol = " ";
      # directory.read_only = " 󰌾";
      docker_context.symbol = " ";
      dotnet.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      erlang.symbol = " ";
      fennel.symbol = " ";
      fortran.symbol = " ";
      fossil_branch.symbol = " ";
      gcloud.symbol = "󱇶 ";
      gleam.symbol = " ";
      # git_branch.symbol = " ";
      git_commit.tag_symbol = "  ";
      golang.symbol = " ";
      gradle.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      helm.symbol = " ";
      hg_branch.symbol = " ";
      hostname.ssh_symbol = " ";
      java.symbol = " ";
      jj_bookmark.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      kubernetes.symbol = "󱃾 ";
      lua.symbol = " ";
      maven.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      mojo.symbol = "󰈸 ";
      nats.symbol = " ";
      netns.symbol = "󰛳 ";
      nim.symbol = " ";
      # nix_shell.symbol = " ";
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      odin.symbol = "󰟢 ";
      opa.symbol = " ";
      openstack.symbol = " ";
      os.symbols = {
        AIX = " ";
        AlmaLinux = " ";
        Alpaquita = " ";
        Alpine = " ";
        ALTLinux = " ";
        Amazon = " ";
        Android = " ";
        AOSC = " ";
        Arch = " ";
        Artix = " ";
        Bazzite = " ";
        Bluefin = " ";
        CachyOS = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Elementary = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = " ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Hurd = " ";
        Illumos = " ";
        InstantOS = " ";
        Ios = "󰀷 ";
        Kali = " ";
        KDENeon = " ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        Nobara = " ";
        OpenBSD = " ";
        OpenCloudOS = " ";
        openEuler = " ";
        openSUSE = " ";
        OracleLinux = "󰺡 ";
        PikaOS = " ";
        Pop = " ";
        Raspbian = " ";
        Redhat = "󱄛 ";
        RedHatEnterprise = "󱄛 ";
        Redox = "󰀘 ";
        RockyLinux = " ";
        Solus = " ";
        SUSE = " ";
        Ubuntu = " ";
        Ultramarine = " ";
        Unknown = " ";
        Uos = " ";
        Void = " ";
        Windows = "󰍲 ";
        Zorin = " ";
      };
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      pijul_channel.symbol = " ";
      pixi.symbol = "󰏗 ";
      pulumi.symbol = " ";
      purescript.symbol = " ";
      python.symbol = " ";
      raku.symbol = "󱖊 ";
      red.symbol = "󱍼 ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = "󱘗 ";
      scala.symbol = " ";
      shlvl.symbol = "󰹍 ";
      singularity.symbol = " ";
      solidity.symbol = " ";
      spack.symbol = " ";
      status.symbol = " ";
      sudo.symbol = " ";
      swift.symbol = " ";
      terraform.symbol = " ";
      vlang.symbol = " ";
      typst.symbol = " ";
      vagrant.symbol = " ";
      xmake.symbol = " ";
      zig.symbol = " ";
    };
  };
}
