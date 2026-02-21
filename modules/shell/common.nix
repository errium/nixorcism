{
  flake.modules.nixos.shell_common = {
    hm = {
      home.shell = {
        enableShellIntegration = true;
        enableBashIntegration = false;
      };
      
      programs = {
        command-not-found.enable = true;
      };
    };
  };
}
