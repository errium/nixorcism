{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf config.nixorcism.packages.cli.fastfetch.enable {
    hm.programs.fastfetch = {
      enable = true;

      settings = let
        color = {
          accent1 = "blue"; # Main part of the logo
          accent2 = "cyan"; # 2nd part of the logo
          accent3 = "cyan"; # Even head keys, title
          accent4 = "blue"; # Odd head keys
          accent5 = "white"; # Sub-keys
        };
      in {
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
            "1" = color.accent1;
            "2" = color.accent2;
          };
        };

        display = {
          separator = " · ";
          color = {
            "title" = color.accent3;
            "keys" = color.accent5;
          };
          bar = {
            width = 10;
            char.elapsed = "■";
            char.total = "─";
          };
          percent = {
            type = ["num" "bar"];
          };
        };

        modules = [
          # Title
          {
            type = "title";
            format = "{user-name-colored}@{host-name-colored}";
          }

          # Separator
          "custom"

          # System Info
          {
            key = "OS/";
            keyColor = color.accent4;
            type = "os";
            format = "{pretty-name}";
          }
          {
            key = "├ Kernel";
            type = "kernel";
          }
          {
            key = "├ Age";
            type = "disk";
            format = "{days} days old";
          }
          {
            key = "└ Uptime";
            type = "uptime";
          }

          # Separator
          "custom"

          # Hardware Info
          {
            key = "PC/";
            keyColor = color.accent3;
            type = "title";
            format = "{host-name}";
          }
          {
            key = "├ Host";
            type = "host";
            format = "{family}";
          }
          {
            key = "├ CPU";
            type = "cpu";
            format = "{name} @ {freq-max} - {temperature}";
            temp = true;
          }
          {
            key = "├ GPU";
            type = "gpu";
            format = "{name} @ {frequency} - {core-usage-num}";
            driverSpecific = true;
          }
          {
            key = "├ Memory";
            type = "memory";
            format = "{percentage-bar} {used} / {total} ({percentage})";
          }
          {
            key = "└ Swap";
            type = "swap";
            format = "{percentage-bar} {used} / {total} ({percentage})";
          }

          # Separator
          "custom"

          # Software Info
          {
            key = "PKGS/";
            keyColor = color.accent4;
            type = "packages";
          }
          {
            key = "├ DE";
            type = "de";
            format = "{pretty-name}";
          }
          {
            type = "wm";
            key = "├ WM";
            format = "{pretty-name}";
          }
          {
            key = "├ Terminal";
            type = "terminal";
            format = "{pretty-name}";
          }
          {
            key = "├ Shell";
            type = "shell";
          }
          {
            key = "└ Editor";
            type = "editor";
          }
        ];
      };
    };
  };
}
