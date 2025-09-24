{
  # Don't check default browser
  "browser.shell.checkDefaultBrowser" = false;

  # Don't warn before quitting
  "browser.warnOnQuit" = false;

  # Enable WebRender
  "gfx.webrender.all" = true;

  # Remove the picture-in-picture toggle
  "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

  # Show the bookmarks toolbar
  "browser.toolbars.bookmarks.visibility" = "always";

  # Don't show warning on "about:config" page
  "browser.aboutConfig.showWarning" = false;

  # Disable translations
  "browser.translations.enable" = false;

  # Enable the installed extensions
  "extensions.autoDisableScopes" = 0;
  
  # Don't use the built-in password manager
  "signon.rememberSignons" = false;
  "signon.autofillForms" = false;

  # Switch tabs by scrolling
  "toolkit.tabbox.switchByScrolling" = true;

  # Don't show the Zen welcome screen
  "zen.welcome-screen.seen" = true;

  # Open bookmarks in a new tab
  "browser.tabs.loadBookmarksInTabs" = true;

  # Disable telemetry
  "toolkit.telemetry.unified" = false;
  "toolkit.telemetry.enabled" = false;
  "toolkit.telemetry.server" = "data:,";
  "toolkit.telemetry.archive.enabled" = false;
  "toolkit.telemetry.coverage.opt-out" = true;
  "toolkit.coverage.opt-out" = true;
  "toolkit.coverage.endpoint.base" = "";
  "experiments.supported" = false;
  "experiments.enabled" = false;
  "experiments.manifest.uri" = "";
  "browser.ping-centre.telemetry" = false;
  "browser.urlbar.eventTelemetry.enabled" = false;
  "browser.newtabpage.activity-stream.feeds.telemetry" = false;
  "devtools.onboarding.telemetry.logged" = false;
  "toolkit.telemetry.newProfilePing.enabled" = false;
  "toolkit.telemetry.shutdownPingSender.enabled" = false;
  "toolkit.telemetry.updatePing.enabled" = false;
  "toolkit.telemetry.bhrPing.enabled" = false;
  "toolkit.telemetry.firstShutdownPing.enabled" = false;

  # Disable health reports
  "datareporting.healthreport.uploadEnabled" = false;
  "datareporting.healthreport.service.enabled" = false;
  "datareporting.policy.dataSubmissionEnabled" = false;
  "datareporting.usage.uploadEnabled" = false;

  # Disable crash reports
  "breakpad.reportURL" = "";
  "browser.tabs.crashReporting.sendReport" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

  # Disable form autofill
  "browser.formfill.enable" = false;
  "extensions.formautofill.addresses.enabled" = false;
  "extensions.formautofill.available" = "off";
  "extensions.formautofill.creditCards.available" = false;
  "extensions.formautofill.creditCards.enabled" = false;
  "extensions.formautofill.heuristics.enabled" = false;

  # Disable Firefox Pocket
  "extensions.pocket.enabled" = false;
  "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  "browser.newtabpage.activity-stream.feeds.topsites" = false;
  "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
  "browser.newtabpage.activity-stream.showSponsored" = false;
  "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
  "browser.newtabpage.activity-stream.feeds.snippets" = false;
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";

  # Disable Firefox Accounts
  "identity.fxaccounts.enabled" = false;
  "identity.fxaccounts.toolbar.enabled" = false;
  "identity.fxaccounts.pairing.enabled" = false;
  "identity.fxaccounts.commands.enabled" = false;

  # Disable recommendations
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "extensions.htmlaboutaddons.recommendations.enabled" = false;
  "extensions.htmlaboutaddons.discover.enabled" = false;
  "extensions.getAddons.showPane" = false;
  "browser.discovery.enabled" = false;
  
  # Don't report compatibility problems
  "extensions.webcompat-reporter.enabled" = false;

  # Disable Firefox Shield Studies
  "app.shield.optoutstudies.enabled" = false;
}