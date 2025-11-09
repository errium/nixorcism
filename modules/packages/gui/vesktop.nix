{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui = {
    vesktop.enable = lib.mkEnableOption "Enables vesktop";
  };

  config = lib.mkIf config.nixorcism.packages.gui.vesktop.enable {
    hm.programs.vesktop = {
      enable = true;

      settings = {
        discordBranch = "stable";
        tray = true;
        minimizeToTray = false;
        arRPC = true;
        hardwareAcceleration = true;
        enableSplashScreen = true;
        splashTheming = true;
        appBadge = true;
        checkUpdates = false;
        spellCheckLanguages = [
          "en"
          "en-US"
          "ru"
        ];
      };
    };

    hm.programs.vesktop.vencord = {
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;

        plugins = {
          CallTimer = {
            enabled = true;
            format = "stopwatch";
          };
          ClearURLs.enabled = true;
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
          FixSpotifyEmbeds.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          ForceOwnerCrown.enabled = true;
          GameActivityToggle = {
            enabled = true;
            oldIcon = false;
          };
          KeepCurrentChannel.enabled = true;
          MemberCount = {
            enabled = true;
            memberList = true;
            toolTip = true;
            voiceActivity = true;
          };
          MessageClickActions.enabled = true;
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
          NoF1.enabled = true;
          OpenInApp = {
            enabled = true;
            spotify = true;
          };
          petpet.enabled = true;
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
          ReadAllNotificationsButton.enabled = true;
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
          SecretRingToneEnabler.enabled = true;
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
          VoiceChatDoubleClick.enabled = true;
          VolumeBooster.enabled = true;
          YoutubeAdblock.enabled = true;
        };
      };
    };
  };
}
