{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell.starship.enable = lib.mkEnableOption "Enable Starship prompt";

  config = lib.mkIf config.nixorcism.shell.starship.enable {
    programs.starship = {
      enable = true;

      settings = {
        add_newline = true;

        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[>](bold red)";
        };

        format = lib.concatStrings [
          "$username"
          "$directory"
          "$git_branch"
          "$git_status"

          "$fill"

          "$nix_shell"
          "$cmd_duration"

          "$line_break"
          "$character"
        ];

        username = {
          show_always = true;
        };
        fill = {
          symbol = " ";
        };

        aws = {
          symbol = " ";
        };

        buf = {
          symbol = " ";
        };

        bun = {
          symbol = " ";
        };

        c = {
          symbol = " ";
        };

        cpp = {
          symbol = " ";
        };

        cmake = {
          symbol = " ";
        };

        conda = {
          symbol = " ";
        };

        crystal = {
          symbol = " ";
        };

        dart = {
          symbol = " ";
        };

        deno = {
          symbol = " ";
        };

        directory = {
          read_only = " 󰌾";
        };

        docker_context = {
          symbol = " ";
        };

        elixir = {
          symbol = " ";
        };

        elm = {
          symbol = " ";
        };

        fennel = {
          symbol = " ";
        };

        fortran = {
          symbol = " ";
        };

        fossil_branch = {
          symbol = " ";
        };

        gcloud = {
          symbol = " ";
        };

        git_branch = {
          symbol = " ";
        };

        git_commit = {
          tag_symbol = "  ";
        };

        golang = {
          symbol = " ";
        };

        gradle = {
          symbol = " ";
        };

        guix_shell = {
          symbol = " ";
        };

        haskell = {
          symbol = " ";
        };

        haxe = {
          symbol = " ";
        };

        hg_branch = {
          symbol = " ";
        };

        hostname = {
          ssh_symbol = " ";
        };

        java = {
          symbol = " ";
        };

        julia = {
          symbol = " ";
        };

        kotlin = {
          symbol = " ";
        };

        lua = {
          symbol = " ";
        };

        memory_usage = {
          symbol = "󰍛 ";
        };

        meson = {
          symbol = "󰔷 ";
        };

        nim = {
          symbol = "󰆥 ";
        };

        nix_shell = {
          symbol = " ";
        };

        nodejs = {
          symbol = " ";
        };

        ocaml = {
          symbol = " ";
        };

        os = {
          symbols = {
            Alpaquita = " ";
            Alpine = " ";
            AlmaLinux = " ";
            Amazon = " ";
            Android = " ";
            AOSC = " ";
            Arch = " ";
            Artix = " ";
            CachyOS = " ";
            CentOS = " ";
            Debian = " ";
            DragonFly = " ";
            Emscripten = " ";
            EndeavourOS = " ";
            Fedora = " ";
            FreeBSD = " ";
            Garuda = "󰛓 ";
            Gentoo = " ";
            HardenedBSD = "󰞌 ";
            Illumos = "󰈸 ";
            Kali = " ";
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
            OpenBSD = "󰈺 ";
            openSUSE = " ";
            OracleLinux = "󰌷 ";
            Pop = " ";
            Raspbian = " ";
            Redhat = " ";
            RedHatEnterprise = " ";
            RockyLinux = " ";
            Redox = "󰀘 ";
            Solus = "󰠳 ";
            SUSE = " ";
            Ubuntu = " ";
            Unknown = " ";
            Void = " ";
            Windows = "󰍲 ";
          };
        };

        package = {
          symbol = "󰏗 ";
        };

        perl = {
          symbol = " ";
        };

        php = {
          symbol = " ";
        };

        pijul_channel = {
          symbol = " ";
        };

        pixi = {
          symbol = "󰏗 ";
        };

        python = {
          symbol = " ";
        };

        rlang = {
          symbol = "󰟔 ";
        };

        ruby = {
          symbol = " ";
        };

        rust = {
          symbol = "󱘗 ";
        };

        scala = {
          symbol = " ";
        };

        status = {
          symbol = " ";
        };

        swift = {
          symbol = " ";
        };

        xmake = {
          symbol = " ";
        };

        zig = {
          symbol = " ";
        };
      };
    };
  };
}
