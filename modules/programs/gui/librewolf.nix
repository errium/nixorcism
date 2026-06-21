{
  flake.modules.nixos.gui_librewolf = {
    config,
    inputs,
    lib,
    ...
  }: let
    glance = config.hm.services.glance.enable;
  in {
    hm.programs.librewolf = lib.mkMerge [
      {
        enable = true;

        languagePacks = [
          "ru"
          "en-US"
        ];

        profiles.default = {
          isDefault = true;
          settings = {
            # Betterfox v150
            # ┏━╸┏━┓┏━┓╺┳╸┏━╸┏━┓╻ ╻
            # ┣╸ ┣━┫┗━┓ ┃ ┣╸ ┃ ┃┏╋┛
            # ╹  ╹ ╹┗━┛ ╹ ╹  ┗━┛╹ ╹
            # Memory cache (128 MB)
            "browser.cache.memory.capacity" = 131072;
            "browser.cache.memory.max_entry_size" = 20480;

            # Network
            "network.http.max-connections" = 1800;
            "network.http.max-persistent-connections-per-server" = 10;
            "network.http.max-urgent-start-excessive-connections-per-host" = 5;
            "network.http.request.max-start-delay" = 5;
            "network.http.pacing.requests.enabled" = false;
            "network.dnsCacheEntries" = 10000;
            "network.dnsCacheExpiration" = 3600;
            "network.ssl_tokens_cache_capacity" = 10240;

            # Media cache (1 GB)
            "media.memory_caches_combined_limit_kb" = 1048576;
            "media.cache_readahead_limit" = 600;
            "media.cache_resume_threshold" = 300;

            # ┏━┓┏┳┓┏━┓┏━┓╺┳╸╻ ╻┏━╸┏━┓╻ ╻
            # ┗━┓┃┃┃┃ ┃┃ ┃ ┃ ┣━┫┣╸ ┃ ┃┏╋┛
            # ┗━┛╹ ╹┗━┛┗━┛ ╹ ╹ ╹╹  ┗━┛╹ ╹
            "apz.overscroll.enabled" = true;
            "general.smoothScroll" = true;
            "general.smoothScroll.msdPhysics.enabled" = true;
            "mousewheel.default.delta_multiplier_y" = 300;

            # ┏━┓┏━╸┏━╸╻ ╻┏━┓┏━╸┏━╸┏━┓╻ ╻
            # ┗━┓┣╸ ┃  ┃ ┃┣┳┛┣╸ ┣╸ ┃ ┃┏╋┛
            # ┗━┛┗━╸┗━╸┗━┛╹┗╸┗━╸╹  ┗━┛╹ ╹
            # Tracking protection
            "browser.contentblocking.category" = "strict";
            "browser.download.start_downloads_in_tmp_dir" = true;
            "browser.uitour.enabled" = false;
            "privacy.globalprivacycontrol.enabled" = true;

            # OCSP & Certs
            "security.OCSP.enabled" = 0;
            "privacy.antitracking.isolateContentScriptResources" = true;
            "security.csp.reporting.enabled" = false;

            # SSL / TLS
            "security.ssl.treat_unsafe_negotiation_as_broken" = true;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "security.tls.enable_0rtt_data" = false;

            # Disk avoidance
            "browser.cache.disk.enable" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "media.memory_cache_max_size" = 65536;
            "browser.sessionstore.interval" = 60000;

            # Shutdown & sanitizing
            "privacy.history.custom" = true;
            "browser.privatebrowsing.resetPBM.enabled" = true;

            # Speculative loading
            "network.http.speculative-parallel-limit" = 0;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "browser.places.speculativeConnect.enabled" = false;
            "network.prefetch-next" = false;

            # Search / URL bar
            "browser.urlbar.trimHttps" = true;
            "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
            "browser.search.separatePrivateDefault.ui.enabled" = true;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.quicksuggest.enabled" = false;
            "browser.urlbar.groupLabels.enabled" = false;
            "browser.formfill.enable" = false;
            "network.IDN_show_punycode" = true;

            # HTTPS-Only mode
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_error_page_user_suggestions" = true;

            # Passwords
            "signon.formlessCapture.enabled" = false;
            "signon.privateBrowsingCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;
            "editor.truncate_user_pastes" = false;

            # Extensions
            "extensions.enabledScopes" = 5;

            # Headers / Referers
            "network.http.referer.XOriginTrimmingPolicy" = 2;

            # Containers
            "privacy.userContext.ui.enabled" = true;

            # Various
            "pdfjs.enableScripting" = false;

            # Safe browsing
            "browser.safebrowsing.downloads.remote.enabled" = false;

            # Mozilla
            "permissions.default.desktop-notification" = 2;
            "permissions.default.geo" = 2;
            "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
            "browser.search.update" = false;
            "permissions.manager.defaultsUrl" = "";
            "extensions.getAddons.cache.enabled" = false;

            # Telemetry
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "datareporting.usage.uploadEnabled" = false;

            # Experiments
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";

            # Crash reports
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;

            # ┏━┓┏━╸┏━┓╻┏ ╻ ╻┏━╸┏━┓╻ ╻
            # ┣━┛┣╸ ┗━┓┣┻┓┗┳┛┣╸ ┃ ┃┏╋┛
            # ╹  ┗━╸┗━┛╹ ╹ ╹ ╹  ┗━┛╹ ╹
            # Mozilla UI
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.preferences.moreFromMozilla" = false;
            "browser.aboutConfig.showWarning" = false;
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.aboutwelcome.enabled" = false;
            "browser.profiles.enabled" = true;

            # Theme
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.compactmode.show" = true;
            "layout.css.prefers-color-scheme.content-override" = 3; # Browser theme
            "browser.privateWindowSeparation.enabled" = false;

            # AI
            "browser.ai.control.default" = "blocked";
            "browser.ml.enable" = false;
            "browser.ml.chat.enabled" = false;
            "browser.ml.chat.menu" = false;
            "browser.tabs.groups.smart.enabled" = false;
            "browser.ml.linkPreview.enabled" = false;

            # Fullscreen notice
            "full-screen-api.transition-duration.enter" = "0 0";
            "full-screen-api.transition-duration.leave" = "0 0";
            "full-screen-api.warning.timeout" = 0;

            # URL bar
            "browser.urlbar.trending.featureGate" = false;
            "browser.urlbar.suggest.engines" = false;

            # New tab page
            "browser.newtabpage.activity-stream.default.sites" = "";
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

            # Downloads
            "browser.download.manager.addToRecentDocs" = false;

            # PDF
            "browser.download.open_pdf_attachments_inline" = true;

            # Tab behavior
            "browser.bookmarks.openInTabClosesMenu" = false;
            "browser.menu.showViewImageInfo" = true;
            "findbar.highlightAll" = true;
            "layout.word_select.eat_space_to_next_word" = false;
          };

          extensions = {
            force = true;
            packages = with inputs.firefox-addons.packages."x86_64-linux";
              [
                auto-tab-discard
                return-youtube-dislikes
                sponsorblock
                ublock-origin
              ]
              # Conditional extension for glance
              ++ lib.optionals glance [new-tab-override];
          };
        };
      }

      # Some more conditional things for glance
      (lib.mkIf glance {
        profiles.default.settings = {
          "browser.startup.homepage" = "http://127.0.0.1:5678";
        };
      })
    ];
  };
}
