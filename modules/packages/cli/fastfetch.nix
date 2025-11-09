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
      keyColor1 = "green";
      keyColor2 = "blue";
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
          separator = "  ";
        };

        modules = [
          {
            key = "";
            keyColor = keyColor1;
            type = "title";
            format = "{user-name} @ {host-name}";
          }

          "custom"

          {
            key = "";
            keyColor = keyColor2;
            type = "os";
            format = "{pretty-name}";
          }
          {
            key = "󰍹";
            keyColor = keyColor2;
            type = "host";
            format = "{family}";
          }
          {
            key = "";
            keyColor = keyColor2;
            type = "kernel";
          }
          {
            key = "󰅕";
            keyColor = keyColor2;
            type = "bootmgr";
            format = "{name}";
          }
          {
            key = "";
            keyColor = keyColor2;
            type = "packages";
          }

          "custom"

          {
            key = "";
            keyColor = keyColor1;
            type = "de";
            format = "{pretty-name}";
          }
          {
            key = "";
            keyColor = keyColor1;
            type = "terminal";
            format = "{pretty-name}";
          }
          {
            key = "";
            keyColor = keyColor1;
            type = "shell";
          }

          "custom"

          {
            key = "";
            keyColor = keyColor2;
            type = "cpu";
            format = "{name} - {freq-max} {temperature}";
            temp = true;
          }
          {
            key = "";
            keyColor = keyColor2;
            type = "gpu";
            format = "{name} {core-usage-num}";
            driverSpecific = true;
          }
          {
            key = "";
            keyColor = keyColor2;
            type = "memory";
            format = "{used} / {total} {percentage}";
          }
          {
            key = "󰾴";
            keyColor = keyColor2;
            type = "swap";
            format = "{used} / {total} {percentage}";
          }

          "custom"

          {
            key = "";
            keyColor = keyColor1;
            type = "disk";
            format = "{days} days old";
          }
          {
            key = "";
            keyColor = keyColor1;
            type = "uptime";
          }
        ];
      };
    };
  };
}
