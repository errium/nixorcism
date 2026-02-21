{
  flake.modules.nixos.gui_vesktop = {
    hm.programs.vesktop = {
      enable = true;
      settings = {
        appBadge = true;
        arRPC = true;
        checkUpdates = true;
        discordBranch = "stable";
        enableSplashScreen = true;
        hardwareAcceleration = true;
        minimizeToTray = false;
        spellCheckLanguages = ["en" "en-US" "ru"];
        splashTheming = true;
        tray = true;
      };
    };

    hm.programs.vesktop.vencord = {
      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        notifyAboutUpdates = true;
        useQuickCss = true;

        plugins = {
          CallTimer = {
            enabled = true;
            format = "stopwatch";
          };

          CustomIdle = {
            enabled = true;
            idleTimeout = 0;
            remainInIdle = false;
          };

          FakeNitro = {
            enabled = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            enableEmojiBypass = true;
            transformEmojis = true;
            transformStickers = true;
            transformCompoundSentence = false;
          };

          FavoriteGifSearch = {
            enabled = true;
            searchOption = "hostandpath";
          };

          GameActivityToggle = {
            enabled = true;
            oldIcon = false;
          };

          MemberCount = {
            enabled = true;
            memberList = true;
            toolTip = true;
            voiceActivity = true;
          };

          MessageLogger = {
            enabled = true;
            collapseDeleted = true;
            deleteStyle = "text";
            ignoreBots = true;
            ignoreSelf = true;
            ignoreUsers = "";
            ignoreChannels = "";
            ignoreGuilds = "";
            logEdits = true;
            logDeletes = true;
            inlineEdits = true;
          };

          OpenInApp = {
            enabled = true;
            spotify = true;
          };

          PlatformIndicators = {
            enabled = true;
            colorMobileIndicator = true;
            list = true;
            badges = true;
            messages = true;
          };

          QuickReply = {
            enabled = true;
            shouldMention = 2;
          };

          RelationshipNotifier = {
            enabled = true;
            offlineRemovals = true;
            groups = true;
            servers = true;
            friends = true;
            friendsRequestCancels = true;
          };

          RoleColorEverywhere = {
            enabled = true;
            chatMentions = true;
            memberList = true;
            voiceUsers = true;
            reactorsList = true;
            pollResults = true;
            colorChatMessages = false;
          };

          ShowHiddenChannels = {
            enabled = true;
            showMode = 0;
            hideUnreads = true;
            defaultAllowedUsersAndRolesDropdownState = true;
          };

          ShowHiddenThings = {
            enabled = true;
            showTimeouts = true;
            showInvitesPaused = true;
            showModView = true;
          };

          ShowTimeoutDuration = {
            enabled = true;
            displayStyle = "tooltip";
          };

          SilentTyping = {
            enabled = true;
            isEnabled = true;
            showIcon = false;
            contextMenu = true;
          };

          SpotifyCrack = {
            enabled = true;
            noSpotifyAutoPause = true;
            keepSpotifyActivityOnIdle = false;
          };

          ClearURLs.enabled = true;
          FixSpotifyEmbeds.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          ForceOwnerCrown.enabled = true;
          KeepCurrentChannel.enabled = true;
          MessageClickActions.enabled = true;
          NoF1.enabled = true;
          ReadAllNotificationsButton.enabled = true;
          SecretRingToneEnabler.enabled = true;
          VoiceChatDoubleClick.enabled = true;
          VolumeBooster.enabled = true;
          YoutubeAdblock.enabled = true;
          petpet.enabled = true;
        };
      };
    };
  };
}
