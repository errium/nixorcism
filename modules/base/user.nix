{
  flake.modules.nixos.base = {username, ...}: {
    users.users = {
      ${username} = {
        isNormalUser = true;
        description = "${username}";
        initialHashedPassword = "$y$j9T$XB4FcgXB0PRd47XKTDwZ01$SvrWcNsrFKbj.b06cma9gkihW0vTyiCZCMgm3hnTi6D";

        extraGroups = [
          "audio"
          "dialout"
          "networkmanager"
          "render"
          "sound"
          "video"
          "wheel"
        ];
      };

      root.initialHashedPassword = "$y$j9T$abwQzHzNERup45fhMIJ1w0$hAzx7W/VviF6JGeMYl0iyfiBt.Sg/sQRdScehbOweo5";
    };
  };
}
