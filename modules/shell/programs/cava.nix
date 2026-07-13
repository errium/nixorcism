{
  flake.modules.nixos.programs'cava = {pkgs, ...}: {
    userPackages = with pkgs; [cava];

    hj.xdg.config.files."cava/config".text = ''
      [general]
      bar_width=1

      [output]
      channels=mono
      ; xaxis=frequency
    '';
  };
}
