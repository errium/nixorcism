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
      logoColor1 = "blue";
      logoColor2 = "green";
      keyColor1 = "cyan";
      keyColor2 = "blue";
      titleColor = "green";
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
            "1" = logoColor1;
            "2" = logoColor2;
          };
        };

        display = {
          separator = " |  ";
          color = {
            "title" = titleColor;
            "keys" = keyColor2;
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
            title = keyColor1;
            format = "{user-name-colored}@{host-name-colored}";
          }
          {
            type = "separator";
          }

          {
            key = "OS  ";
            keyColor = keyColor2;
            type = "os";
            format = "{pretty-name}";
          }
          {
            key = "KRNL";
            keyColor = keyColor2;
            type = "kernel";
          }
          {
            key = "HOST";
            keyColor = keyColor2;
            type = "host";
            format = "{family}";
          }
          {
            key = "PKGS";
            keyColor = keyColor2;
            type = "packages";
          }

          "custom"
          {
            key = "DE  ";
            keyColor = keyColor1;
            type = "de";
            format = "{pretty-name}";
          }
          {
            type = "wm";
            key = "WM  ";
            keyColor = keyColor1;
            format = "{pretty-name}";
          }
          {
            key = "TERM";
            keyColor = keyColor1;
            type = "terminal";
            format = "{pretty-name}";
          }
          {
            key = "SH  ";
            keyColor = keyColor1;
            type = "shell";
          }

          "custom"

          {
            key = "CPU ";
            keyColor = keyColor2;
            type = "cpu";
            format = "{name} @ {freq-max} - {temperature}";
            temp = true;
          }
          {
            key = "GPU ";
            keyColor = keyColor2;
            type = "gpu";
            format = "{name} @ {frequency} - {core-usage-num}";
            driverSpecific = true;
          }
          {
            key = "RAM ";
            keyColor = keyColor2;
            type = "memory";
            format = "{percentage-bar} {used} / {total} ({percentage})";
          }
          {
            key = "SWAP";
            keyColor = keyColor2;
            type = "swap";
            format = "{percentage-bar} {used} / {total} ({percentage})";
          }

          "custom"

          {
            key = "AGE ";
            keyColor = keyColor1;
            type = "disk";
            format = "{days} days old";
          }
          {
            key = "UP  ";
            keyColor = keyColor1;
            type = "uptime";
          }
          "custom"
          "colors"
        ];
      };
    };
  };
}
