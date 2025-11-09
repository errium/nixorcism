{lib, ...}: let
  vague = {
    base00 = "#141415";
    base01 = "#252530";
    base02 = "#606079";
    base03 = "#606079";
    base04 = "#aeaed1";
    base05 = "#cdcdcd";
    base06 = "#d7d7d7";
    base07 = "#d7d7d7";
    base08 = "#d8647e";
    base09 = "#f3be7c";
    base0A = "#f5cb96";
    base0B = "#7fa563";
    base0C = "#aeaed1";
    base0D = "#6e94b2";
    base0E = "#bb9dbd";
    base0F = "#e08398";
  };

  oxocarbon = {
    base00 = "#161616";
    base01 = "#262626";
    base02 = "#393939";
    base03 = "#525252";
    base04 = "#dde1e6";
    base05 = "#f2f4f8";
    base06 = "#ffffff";
    base07 = "#82cfff";
    base08 = "#ee5396";
    base09 = "#78a9ff";
    base0A = "#ff7eb6";
    base0B = "#42be65";
    base0C = "#08bdba";
    base0D = "#33b1ff";
    base0E = "#be95ff";
    base0F = "#3ddbd9";
  };
in {
  options.nixorcism.stylixColors = {
    vague = lib.mkOption {type = lib.types.attrs;};
    oxocarbon = lib.mkOption {type = lib.types.attrs;};
  };

  config.nixorcism.stylixColors = {
    vague = vague;
    oxocarbon = oxocarbon;
  };
}
