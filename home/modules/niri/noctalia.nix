{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = [
    inputs.noctalia.packages.${pkgs.system}.default
    inputs.quickshell.packages.${pkgs.system}.default
  ]
  ++ (with pkgs; [
    gpu-screen-recorder
  ]);

  programs.noctalia-shell = {
    enable = true;

    settings = {
      bar = {
        position = "top";
        backgroundOpacity = 1;
        monitors = [ ];
        density = "default";
        showCapsule = false;
        floating = false;
        marginVertical = 0.25;
        marginHorizontal = 0.25;

        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            { id = "Workspace"; }
            {
              id = "ActiveWindow";
              showIcon = false;
            }
          ];

          center = [
          ];

          right = [
            { id = "Tray"; }
            {
              id = "Battery";
              displayMode = "alwaysShow";
            }
            {
              id = "SystemMonitor";
              showCpuUsage = false;
              showCpuTemp = false;
              showMemoryUsage = false;
              showNetworkStats = true;
              showDiskUsage = true;
            }
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            {
              id = "Brightness";
              displayMode = "alwaysShow";
            }
            {
              id = "Volume";
              displayMode = "alwaysShow";
            }
            {
              id = "KeyboardLayout";
              displayMode = "forceOpen";
            }
            {
              id = "Clock";
              formatHorizontal = "dddd, dd MMMM, HH:mm";
            }
            { id = "NotificationHistory"; }
          ];
        };
      };

      general = {
        avatarImage = "";
        dimDesktop = false;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        radiusRatio = 0;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
      };

      location = {
        name = "Vilnius";
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
      };

      screenRecorder = {
        directory = "";
        frameRate = 60;
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        audioSource = "default_output";
        videoSource = "portal";
      };

      wallpaper = {
        enabled = false;
        directory = "";
        enableMultiMonitorDirectories = false;
        setWallpaperOnAllMonitors = true;
        defaultWallpaper = "";
        fillMode = "crop";
        fillColor = "#000000";
        randomEnabled = false;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        monitors = [ ];
      };

      appLauncher = {
        enableClipboardHistory = false;
        position = "center";
        backgroundOpacity = 1;
        pinnedExecs = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "xterm -e";
      };

      controlCenter = {
        position = "close_to_bar_button";
      };

      dock = {
        displayMode = "exclusive";
        backgroundOpacity = 1;
        floatingRatio = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
      };

      network = {
        wifiEnabled = true;
      };

      notifications = {
        doNotDisturb = false;
        monitors = [ ];
        location = "top_right";
        alwaysOnTop = true;
        lastSeenTs = 0;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
      };

      osd = {
        enabled = true;
        location = "bottom_center";
        monitors = [ ];
        autoHideMs = 2000;
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = true;
        cavaFrameRate = 60;
        visualizerType = "none";
        mprisBlacklist = [ ];
        preferredPlayer = "";
      };

      ui = {
        fontDefault = "JetBrainsMono Nerd Font";
        fontFixed = "JetBrainsMono Nerd Font";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        monitorsScaling = [ ];
        idleInhibitorEnabled = false;
        tooltipsEnabled = true;
      };

      brightness = {
        brightnessStep = 5;
      };

      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "colors";
        darkMode = true;
        matugenSchemeType = "scheme-fruit-salad";
        generateTemplatesForPredefined = false;
      };

      templates = {
        gtk = false;
        qt = false;
        kitty = false;
        ghostty = false;
        foot = false;
        fuzzel = false;
        vesktop = false;
        pywalfox = false;
        enableUserTemplates = false;
      };

      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
      };
    };

    # Oxocarbon
    colors = {
      mError = "#78a9ff"; # Attention needed
      mOnError = "#161616"; # Idk
      mOnPrimary = "#161616"; # Current workspace number
      mOnSecondary = "#161616"; # Inactive workspace number (& calendar day)
      mOnSurface = "#f2f4f8"; # Widget color
      mOnSurfaceVariant = "#525252"; # Dark text
      mOnTertiary = "#161616"; # Highlighted symbol
      mOutline = "#262626"; # Boxes / borders
      mPrimary = "#f2f4f8"; # Main text
      mSecondary = "#f2f4f8"; # "Other" workspaces & misc
      mShadow = "#000000"; # Shadow
      mSurface = "#161616"; # Background
      mSurfaceVariant = "#161616"; # Capsules and CC elements
      mTertiary = "#f2f4f8"; # Highlighted background
    };
  };
}
