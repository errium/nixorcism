{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell.starship.enable = lib.mkEnableOption "Enable Starship prompt";

  config = lib.mkIf config.nixorcism.shell.starship.enable {
    hm.programs.starship = {
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

        username.show_always = true;
        fill.symbol = " ";

        # Nerd fonts symbols
        aws.symbol = " ";
        buf.symbol = " ";
        bun.symbol = " ";
        c.symbol = " ";
        cpp.symbol = " ";
        cmake.symbol = " ";
        conda.symbol = " ";
        crystal.symbol = " ";
        dart.symbol = " ";
        deno.symbol = " ";
        directory.read_only = " 󰌾";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        fennel.symbol = " ";
        fossil_branch.symbol = " ";
        gcloud.symbol = " ";
        git_branch.symbol = " ";
        git_commit.tag_symbol = "  ";
        golang.symbol = " ";
        gradle.symbol = " ";
        guix_shell.symbol = " ";
        haskell.symbol = " ";
        haxe.symbol = " ";
        hg_branch.symbol = " ";
        hostname.ssh_symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        kotlin.symbol = " ";
        lua.symbol = " ";
        memory_usage.symbol = "󰍛 ";
        meson.symbol = "󰔷 ";
        nim.symbol = "󰆥 ";
        nix_shell.symbol = " ";
        nodejs.symbol = " ";
        ocaml.symbol = " ";
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
        package.symbol = "󰏗 ";
        perl.symbol = " ";
        php.symbol = " ";
        pijul_channel.symbol = " ";
        pixi.symbol = "󰏗 ";
        python.symbol = " ";
        rlang.symbol = "󰟔 ";
        ruby.symbol = " ";
        rust.symbol = "󱘗 ";
        scala.symbol = " ";
        status.symbol = " ";
        swift.symbol = " ";
        zig.symbol = " ";

        # Bracketed segments
        aws.format = ''\[[$symbol($profile)(\($region\))(\[$duration\])]($style)\]'';
        azure.format = ''\[[$symbol($subscription)]($style)\]'';
        battery.format = ''\[[$symbol$percentage]($style)\]'';
        buf.format = ''\[[$symbol($version)]($style)\]'';
        bun.format = ''\[[$symbol($version)]($style)\]'';
        c.format = ''\[[$symbol($version(-$name))]($style)\]'';
        cmake.format = ''\[[$symbol($version)]($style)\]'';
        cmd_duration.format = ''\[[\u23f1 $duration]($style)\]'';
        cobol.format = ''\[[$symbol($version)]($style)\]'';
        conda.format = ''\[[$symbol$environment]($style)\]'';
        container.format = ''\[[$symbol \[$name\]]($style)\]'';
        cpp.format = ''\[[$symbol($version(-$name))]($style)\]'';
        crystal.format = ''\[[$symbol($version)]($style)\]'';
        daml.format = ''\[[$symbol($version)]($style)\]'';
        dart.format = ''\[[$symbol($version)]($style)\]'';
        deno.format = ''\[[$symbol($version)]($style)\]'';
        direnv.format = ''\[[$symbol$loaded/$allowed]($style)\]'';
        docker_context.format = ''\[[$symbol$context]($style)\]'';
        dotnet.format = ''\[[$symbol($version)(🎯 $tfm)]($style)\]'';
        elixir.format = ''\[[$symbol($version \(OTP $otp_version\))]($style)\]'';
        elm.format = ''\[[$symbol($version)]($style)\]'';
        erlang.format = ''\[[$symbol($version)]($style)\]'';
        fennel.format = ''\[[$symbol($version)]($style)\]'';
        fossil_branch.format = ''\[[$symbol$branch]($style)\]'';
        fossil_metrics.format = ''\[[$added]($added_style)\]\[[$deleted]($deleted_style)\]'';
        gcloud.format = ''\[[$symbol$account(@$domain)(\($region\))]($style)\]'';
        git_branch.format = ''\[[$symbol$branch]($style)\]'';
        git_commit.format = ''\[[\($hash$tag\)]($style)\]'';
        git_metrics.format = ''\[[$added]($added_style)\]\[[$deleted]($deleted_style)\]'';
        git_state.format = ''\[[$state ($progress_current/$progress_total)]($style)\]'';
        git_status.format = ''([\[$all_status$ahead_behind\]]($style))'';
        gleam.format = ''\[[$symbol($version)]($style)\]'';
        golang.format = ''\[[$symbol($version)]($style)\]'';
        gradle.format = ''\[[$symbol($version)]($style)\]'';
        guix_shell.format = ''\[[$symbol]($style)\]'';
        haskell.format = ''\[[$symbol($version)]($style)\]'';
        haxe.format = ''\[[$symbol($version)]($style)\]'';
        helm.format = ''\[[$symbol($version)]($style)\]'';
        hg_branch.format = ''\[[$symbol$branch]($style)\]'';
        hostname.format = ''\[[$ssh_symbol($hostname)]($style)\] '';
        java.format = ''\[[$symbol($version)]($style)\]'';
        jobs.format = ''\[[$symbol$number]($style)\]'';
        julia.format = ''\[[$symbol($version)]($style)\]'';
        kotlin.format = ''\[[$symbol($version)]($style)\]'';
        kubernetes.format = ''\[[$symbol$context( \($namespace\))]($style)\]'';
        localip.format = ''\[[$localipv4]($style)\]'';
        lua.format = ''\[[$symbol($version)]($style)\]'';
        memory_usage.format = ''\[[$symbol[$ram( | $swap)]]($style)\]'';
        meson.format = ''\[[$symbol$project]($style)\]'';
        mise.format = ''\[[$symbol$health]($style)\]'';
        mojo.format = ''\[[$symbol($version)]($style)\]'';
        nats.format = ''\[[$symbol$name]($style)\]'';
        netns.format = ''\[[$symbol \[$name\]]($style)\]'';
        nim.format = ''\[[$symbol($version)]($style)\]'';
        nix_shell.format = ''\[[$symbol$state( \($name\))]($style)\]'';
        nodejs.format = ''\[[$symbol($version)]($style)\]'';
        ocaml.format = ''\[[$symbol($version)(\($switch_indicator$switch_name\))]($style)\]'';
        odin.format = ''\[[$symbol($version )]($style)\]'';
        opa.format = ''\[[$symbol($version)]($style)\]'';
        openstack.format = ''\[[$symbol$cloud(\($project\))]($style)\]'';
        os.format = ''\[[$symbol]($style)\]'';
        package.format = ''\[[$symbol$version]($style)\]'';
        perl.format = ''\[[$symbol($version)]($style)\]'';
        php.format = ''\[[$symbol($version)]($style)\]'';
        pijul_channel.format = ''\[[$symbol$channel]($style)\]'';
        pixi.format = ''\[[$symbol$version( $environment)]($style)\]'';
        pulumi.format = ''\[[$symbol$stack]($style)\]'';
        quarto.format = ''\[[$symbol($version)]($style)\]'';
        raku.format = ''\[[$symbol($version-$vm_version)]($style)\]'';
        red.format = ''\[[$symbol($version)]($style)\]'';
        rlang.format = ''\[[$symbol($version)]($style)\]'';
        ruby.format = ''\[[$symbol($version)]($style)\]'';
        rust.format = ''\[[$symbol($version)]($style)\]'';
        scala.format = ''\[[$symbol($version)]($style)\]'';
        shell.format = ''\[[$indicator]($style)\]'';
        singularity.format = ''\[[$symbol\[$env\]]($style)\]'';
        solidity.format = ''\[[$symbol($version)]($style)\]'';
        spack.format = ''\[[$symbol$environment]($style)\]'';
        status.format = ''\[[$symbol$status]($style)\]'';
        sudo.format = ''\[[\as $symbol]($style)\]'';
        swift.format = ''\[[$symbol($version)]($style)\]'';
        terraform.format = ''\[[$symbol$workspace]($style)\]'';
        time.format = ''\[[$time]($style)\]'';
        typst.format = ''\[[$symbol($version)]($style)\]'';
        username.format = ''\[[$user]($style)\]'';
        vagrant.format = ''\[[$symbol($version)]($style)\]'';
        vcsh.format = ''\[vcsh [$symbol$repo]($style)\]'';
        vlang.format = ''\[[$symbol($version)]($style)\]'';
        zig.format = ''\[[$symbol($version)]($style)\]'';
      };
    };
  };
}
