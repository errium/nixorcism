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
        format = "$username$hostname$directory$git_branch$git_commit$git_state$git_metrics$git_status$docker_context$package$buf$cmake$c$crystal$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$gleam$golang$gradle$haskell$helm$java$julia$kotlin$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$ruby$rust$scala$swift$terraform$typst$vagrant$zig$buf$cd$conda$container$docker_context$aws$gcloud$openstack$azure$direnv$env_var$fill$jobs$jvm$line_break$memory_usage$os$package$python$rlang$ruby$status$shell$shlvl$sudo$taskwarrior$terraform$time$vagrant$vcsh$watson$cmd_duration$character";
        right_format = "$cmd_duration$status";

        username = {
          style_user = "bright-blue bold";
          style_root = "bright-red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };

        hostname = {
          ssh_only = false;
          format = "on [$hostname](bold yellow) ";
          disabled = false;
        };

        directory = {
          style = "bright-cyan bold";
          format = "in [$path]($style) ";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = " ";
            "Pictures" = " ";
          };
        };

        git_branch = {
          symbol = " ";
          style = "bright-purple bold";
          format = "on [$symbol$branch]($style) ";
        };

        git_commit = {
          tag_symbol = " ";
          style = "bright-green bold";
          format = "[\($hash$tag\)]($style) ";
        };

        git_state = {
          style = "bright-yellow bold";
          format = "[\($state\($progress_current/$progress_total\))]($style) ";
        };

        git_metrics = {
          disabled = false;
          format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
          added_style = "bright-green";
          deleted_style = "bright-red";
        };

        git_status = {
          style = "bright-yellow bold";
          format = "([$all_status$ahead_behind]($style) )";
          conflicted = " ";
          ahead = "⇡ ";
          behind = "⇣ ";
          diverged = "⇕ ";
          up_to_date = " ";
          untracked = " ";
          stashed = " ";
          modified = " ";
          staged = " ";
          renamed = " ";
          deleted = " ";
        };

        docker_context = {
          symbol = "🐳 ";
          style = "bright-blue bold";
          format = "via [$symbol$context]($style) ";
        };

        package = {
          symbol = "📦 ";
          style = "bright-cyan bold";
          format = "via [$symbol$version]($style) ";
        };

        nodejs = {
          symbol = " ";
          style = "bright-green bold";
          format = "via [$symbol($version )]($style)";
        };

        python = {
          symbol = "🐍 ";
          style = "bright-yellow bold";
          format = "via [${symbol}${pyenv_prefix}(${version} )(\($virtualenv\) )]($style)";
          pyenv_version_name = true;
          pyenv_prefix = "pyenv ";
        };

        rust = {
          symbol = "🦀 ";
          style = "bright-red bold";
          format = "via [$symbol($version )]($style)";
        };

        golang = {
          symbol = "🐹 ";
          style = "bright-cyan bold";
          format = "via [$symbol($version )]($style)";
        };

        lua = {
          symbol = "🌙 ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        java = {
          symbol = "☕ ";
          style = "bright-red bold";
          format = "via [$symbol($version )]($style)";
        };

        kotlin = {
          symbol = "🅺 ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        scala = {
          symbol = "🆂 ";
          style = "bright-red bold";
          format = "via [$symbol($version )]($style)";
        };

        haskell = {
          symbol = "λ ";
          style = "bright-purple bold";
          format = "via [$symbol($version )]($style)";
        };

        perl = {
          symbol = "🐪 ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        php = {
          symbol = "🐘 ";
          style = "bright-purple bold";
          format = "via [$symbol($version )]($style)";
        };

        ruby = {
          symbol = "💎 ";
          style = "bright-red bold";
          format = "via [$symbol($version )]($style)";
        };

        crystal = {
          symbol = "🔮 ";
          style = "bright-red bold";
          format = "via [$symbol($version )]($style)";
        };

        elixir = {
          symbol = "💧 ";
          style = "bright-purple bold";
          format = "via [$symbol($version )]($style)";
        };

        elm = {
          symbol = "🌳 ";
          style = "bright-green bold";
          format = "via [$symbol($version )]($style)";
        };

        erlang = {
          symbol = " ";
          style = "bright-red bold";
          format = "via [$symbol($version )]($style)";
        };

        dart = {
          symbol = "🎯 ";
          style = "bright-cyan bold";
          format = "via [$symbol($version )]($style)";
        };

        deno = {
          symbol = "🦕 ";
          style = "bright-green bold";
          format = "via [$symbol($version )]($style)";
        };

        dotnet = {
          symbol = "•NET ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        julia = {
          symbol = "ஃ ";
          style = "bright-purple bold";
          format = "via [$symbol($version )]($style)";
        };

        nim = {
          symbol = "👑 ";
          style = "bright-yellow bold";
          format = "via [$symbol($version )]($style)";
        };

        rlang = {
          symbol = "📊 ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        swift = {
          symbol = "🦉 ";
          style = "bright-orange bold";
          format = "via [$symbol($version )]($style)";
        };

        terraform = {
          symbol = "🏗️ ";
          style = "bright-purple bold";
          format = "via [$symbol($version )]($style)";
        };

        vagrant = {
          symbol = "⍱ ";
          style = "bright-cyan bold";
          format = "via [$symbol($version )]($style)";
        };

        zig = {
          symbol = "⚡ ";
          style = "bright-yellow bold";
          format = "via [$symbol($version )]($style)";
        };

        buf = {
          symbol = "🐃 ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        cmake = {
          symbol = "🔧 ";
          style = "bright-blue bold";
          format = "via [$symbol($version )]($style)";
        };

        conda = {
          symbol = "🅲 ";
          style = "bright-green bold";
          format = "via [$symbol$environment]($style) ";
        };

        aws = {
          symbol = "☁️ ";
          style = "bright-yellow bold";
          format = "on [$symbol($profile )(\($region\) )]($style)";
        };

        gcloud = {
          symbol = "☁️ ";
          style = "bright-blue bold";
          format = "on [$symbol$account(@$domain)(\($region\))]($style) ";
        };

        openstack = {
          symbol = "☁️ ";
          style = "bright-yellow bold";
          format = "on [$symbol$cloud(\($project\))]($style) ";
        };

        azure = {
          symbol = "☁️ ";
          style = "bright-blue bold";
          format = "on [$symbol($subscription)]($style) ";
        };

        env_var = {
          variable = "SHELL";
          style = "bright-white bold";
          format = "using [$env_value]($style) ";
        };

        jobs = {
          symbol = " ";
          style = "bright-blue bold";
          format = "[$symbol$number]($style) ";
        };

        memory_usage = {
          symbol = "💾 ";
          style = "bright-gray bold";
          format = "[$symbol${ram}]($style) ";
          disabled = true;
        };

        os = {
          style = "bright-white bold";
          format = "[$symbol]($style) ";
        };

        shell = {
          style = "bright-white bold";
          format = "[$indicator]($style) ";
        };

        status = {
          style = "bright-red bold";
          format = "[$symbol$status]($style) ";
          symbol = "✗ ";
          success_symbol = "";
          not_executable_symbol = "🚫 ";
          not_found_symbol = "🔍 ";
          sigint_symbol = "🛑 ";
          signal_symbol = "⚡ ";
        };

        sudo = {
          style = "bright-red bold";
          format = "[$symbol]($style) ";
          symbol = "👑 ";
          disabled = false;
        };

        cmd_duration = {
          min_time = 2000;
          style = "bright-yellow bold";
          format = "took [$duration]($style) ";
        };

        time = {
          disabled = true;
          style = "bright-white bold";
          format = "at [$time]($style) ";
        };

        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[>](bold red)";
          vimcmd_symbol = "[<](bold green)";
          vimcmd_replace_one_symbol = "[<](bold purple)";
          vimcmd_replace_symbol = "[<](bold purple)";
          vimcmd_visual_symbol = "[<](bold yellow)";
        };
      };
    };
  };
}
