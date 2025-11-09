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

        vencord = {
          settings = {
            autoUpdate = false;
            autoUpdateNotification = false;
            notifyAboutUpdates = false;
            useQuickCss = true;

            themeLinks = [
              "https://raw.githubusercontent.com/vivifalls/oxocarbon-discord/refs/heads/main/oxocarbondiscord.theme.css"
            ];

            plugins = {
              # Voice & communication
              CallTimer = {
                enabled = true;
                format = "stopwatch";
              };
              SilentTyping = {
                enabled = true;
                isEnabled = true;
                showIcon = false;
                contextMenu = true;
              };
              VoiceChatDoubleClick.enabled = true;
              VolumeBooster.enabled = true;

              # Message & chat enhancements
              MessageClickActions.enabled = true;
              QuickReply = {
                enabled = true;
                shouldMention = 2;
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

              # Nitro
              FakeNitro = {
                enabled = true;
                enableStickerBypass = true;
                enableStreamQualityBypass = true;
                enableEmojiBypass = true;
                transformEmojis = true;
                transformStickers = true;
                transformCompoundSentence = false;
              };

              # UI & visual enhancements
              ForceOwnerCrown.enabled = true;
              MemberCount = {
                enabled = true;
                memberList = true;
                toolTip = true;
                voiceActivity = true;
              };
              PlatformIndicators = {
                enabled = true;
                colorMobileIndicator = true;
                list = true;
                badges = true;
                messages = true;
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
              petpet.enabled = true;

              # Channel & server features
              KeepCurrentChannel.enabled = true;
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

              # Notifications
              ReadAllNotificationsButton.enabled = true;
              RelationshipNotifier = {
                enabled = true;
                offlineRemovals = true;
                groups = true;
                servers = true;
                friends = true;
                friendsRequestCancels = true;
              };

              # Media & embeds
              FavoriteGifSearch = {
                enabled = true;
                searchOption = "hostandpath";
              };
              FixSpotifyEmbeds.enabled = true;
              FixYoutubeEmbeds.enabled = true;
              OpenInApp = {
                enabled = true;
                spotify = true;
              };

              # Spotify integration
              SpotifyCrack = {
                enabled = true;
                noSpotifyAutoPause = true;
                keepSpotifyActivityOnIdle = false;
              };

              # Utility & quality of life
              ClearURLs.enabled = true;
              CustomIdle = {
                enabled = true;
                idleTimeout = 0;
                remainInIdle = false;
              };
              GameActivityToggle = {
                enabled = true;
                oldIcon = false;
              };
              NoF1.enabled = true;
              SecretRingToneEnabler.enabled = true;
              YoutubeAdblock.enabled = true;
            };
          };
        };
      };
    };
  };
}
