{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    fastfetch.enable = lib.mkEnableOption "Enables fastfetch";
  };

  config = lib.mkIf config.nixorcism.packages.cli.fastfetch.enable {
    hm.programs.fastfetch = let
      colors = {
        logo1 = "blue";
        logo2 = "green";
        keys1 = "cyan";
        keys2 = "blue";
        title = "green";
      };
    in {
      enable = true;

      settings = {
        logo = {
          type = "data";
          source = ''
            $1          ▗▄▄▄       $2.*#&.    ,~=,
            $1          ▜███▙       $2&*+)^  %*^@*
            $1           ▜███▙       $2>=-@\/%*$)
            $1            ▜███▙       $2}(!-)$^]
            $1     ▟█████████████████▙ $2&(#@)/     $1▟▙
            $1    ▟███████████████████▙ $2$]<$\    $1▟██▙
            $2           ,___,           !)::&  $1▟███▛
            $2          [$*@#             %#!$ $1▟███▛
            $2         &*%!^               \/ $1▟███▛
            $2/)(*&!#$_#>)*                  $1▟██████████▙
            $2\!@#*@#%<>?&                  $1▟███████████▛
            $2      *}^#* $1▟▙               ▟███▛
            $2     &[!@) $1▟██▙             ▟███▛
            $2    /#$)$  $1▜███▙           ▝▀▀▀▀
            $2    <][(    $1▜███▙ $2%&!~)$&!_)$*!@#$(<>/
            $2     ^@     $1▟████▙ $2^?><!#$!(*&%!_%^)/
            $1           ▟██████▙       $2*(!)\
            $1          ▟███▛▜███▙       $2{>@%!
            $1         ▟███▛  ▜███▙       $2&^#$|
            $1         ▝▀▀▀    ▀▀▀▀▘       $2"*="
          '';
          position = "left";
          color = {
            "1" = colors.logo1;
            "2" = colors.logo2;
          };
        };

        display = {
          separator = "  ";
          color = {
            "title" = colors.title;
            "keys" = colors.keys2;
          };
          bar = {
            width = 10;
            char.elapsed = "■";
            char.total = "-";
          };
          percent = {
            type = ["num" "bar"];
          };
        };

        modules = [
          {
            type = "title";
            title = colors.keys1;
            format = "{user-name-colored}@{host-name-colored}";
          }
          {
            type = "separator";
          }
          {
            key = "OS  ";
            keyColor = colors.keys2;
            type = "os";
            format = "{pretty-name}";
          }
          {
            key = "KRNL";
            keyColor = colors.keys2;
            type = "kernel";
          }
          {
            key = "HOST";
            keyColor = colors.keys2;
            type = "host";
            format = "{family}";
          }
          {
            key = "PKGS";
            keyColor = colors.keys2;
            type = "packages";
          }

          "custom"

          {
            key = "DE  ";
            keyColor = colors.keys1;
            type = "de";
            format = "{pretty-name}";
          }
          {
            type = "wm";
            key = "WM  ";
            keyColor = colors.keys1;
            format = "{pretty-name}";
          }
          {
            key = "TERM";
            keyColor = colors.keys1;
            type = "terminal";
            format = "{pretty-name}";
          }
          {
            key = "SH  ";
            keyColor = colors.keys1;
            type = "shell";
          }

          "custom"

          {
            key = "CPU ";
            keyColor = colors.keys2;
            type = "cpu";
            format = "{name} @ {freq-max} - {temperature}";
            temp = true;
          }
          {
            key = "GPU ";
            keyColor = colors.keys2;
            type = "gpu";
            format = "{name} @ {frequency} - {core-usage-num}";
            driverSpecific = true;
          }
          {
            key = "RAM ";
            keyColor = colors.keys2;
            type = "memory";
            format = "{percentage-bar} {used} / {total} ({percentage})";
          }
          {
            key = "SWAP";
            keyColor = colors.keys2;
            type = "swap";
            format = "{percentage-bar} {used} / {total} ({percentage})";
          }

          "custom"

          {
            key = "AGE ";
            keyColor = colors.keys1;
            type = "disk";
            format = "{days} days old";
          }
          {
            key = "UP  ";
            keyColor = colors.keys1;
            type = "uptime";
          }

          "custom"

          "colors"
        ];
      };
    };
  };
}
