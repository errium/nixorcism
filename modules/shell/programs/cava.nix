{
  flake.modules.nixos.programs'cava = {pkgs, ...}: {
    hj.packages = with pkgs; [cava];

    hj.xdg.config.files."cava/config".text = ''
      [general]
      bar_width=1

      [output]
      channels=mono
      ; xaxis=frequency
    '';
  };
}
