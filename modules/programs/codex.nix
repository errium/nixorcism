{
  flake.modules.nixos.programs'codex = {pkgs, ...}: {
    hj.packages = with pkgs; [codex];

    nixorcism.preserve.user.directories = [".codex"];
  };
}
