{
  hm.home.shell = {
    enableShellIntegration = true;

    # NOTE: Disabled because I keep bash as a fallback shell,
    # so I prefer to keep it as "vanilla" as possible,
    # with minimal external integrations
    enableBashIntegration = false;
  };

  # No better place for this ;-;
  hm.programs.command-not-found.enable = true;
}
