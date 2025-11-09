{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    fastfetch.enable = lib.mkEnableOption "Enables fastfetch";
  };

  config = lib.mkIf config.nixorcism.packages.cli.fastfetch.enable {
    hm = {
      programs.fastfetch = {
        enable = true;

        settings = {
          logo = {
            type = "auto";
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
            # color = {
            #   "1" = "blue";
            #   "2" = "blue";
            # };
          };

          display = {
            separator = "  ";
            # color = {
            #   keys = "blue";
            # };
          };

          modules = [
            {
              key = "";
              keyColor = "red";
              type = "title";
              format = "{user-name} @ {host-name}";
            }

            "custom"

            {
              key = "";
              keyColor = "green";
              type = "os";
              format = "{pretty-name}";
            }
            {
              key = "󰍹";
              keyColor = "green";
              type = "host";
              format = "{family}";
            }
            {
              key = "";
              keyColor = "green";
              type = "kernel";
            }
            {
              key = "󰅕";
              keyColor = "green";
              type = "bootmgr";
              format = "{name}";
            }
            {
              key = "";
              keyColor = "green";
              type = "packages";
            }

            "custom"

            {
              key = "";
              keyColor = "yellow";
              type = "de";
              format = "{pretty-name}";
            }
            {
              key = "";
              keyColor = "yellow";
              type = "terminal";
              format = "{pretty-name}";
            }
            {
              key = "";
              keyColor = "yellow";
              type = "shell";
            }

            "custom"

            {
              key = "";
              keyColor = "blue";
              type = "cpu";
              format = "{name} - {freq-max} {temperature}";
              temp = true;
            }
            {
              key = "";
              keyColor = "blue";
              type = "gpu";
              format = "{name} {core-usage-num}";
              driverSpecific = true;
            }
            {
              key = "";
              keyColor = "blue";
              type = "memory";
              format = "{used} / {total} {percentage}";
            }
            {
              key = "󰾴";
              keyColor = "blue";
              type = "swap";
              format = "{used} / {total} {percentage}";
            }

            "custom"

            {
              key = "";
              keyColor = "magenta";
              type = "disk";
              format = "{days} days old";
            }
            {
              key = "";
              keyColor = "magenta";
              type = "uptime";
            }
          ];
        };
      };
    };
  };
}
