{
  flake.modules.nixos.programs'codex = {pkgs, ...}: {
    hj.programs = with pkgs; [codex];

    nixorcism.preserve.user.directories = [".codex"];
  };
}
