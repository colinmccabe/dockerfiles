user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.backspace_action", 0);
user_pref("browser.ctrlTab.recentlyUsedOrder", false);
user_pref("browser.search.widget.inNavBar", true);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.startup.page", 3); // Restore tabs
user_pref("browser.uidensity", 1);
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("dom.security.https_only_mode", true);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("media.gmp-widevinecdm.enabled", false);
user_pref("network.cookie.sameSite.laxByDefault", true);
user_pref("network.http.sendRefererHeader", 0);
user_pref("places.history.expiration.max_pages", 3000);
user_pref("places.history.expiration.transient_current_max_pages", 3000);
user_pref("privacy.donottrackheader.enabled", false);
// Not in user.js, but is enabled when enabling Strict protection in UI
user_pref("privacy.trackingprotection.socialtracking.enabled", true);

//
// user.js overrides
//
user_pref("app.update.auto", false);
user_pref("browser.formfill.enable", true);
user_pref("browser.privatebrowsing.autostart", false);
user_pref("browser.search.suggest.enabled", true);
user_pref("browser.urlbar.autoFill", true); // Enables URL autocomplete
user_pref("browser.urlbar.autoFill.typed", true);
user_pref("browser.urlbar.suggest.history", true);
user_pref("fission.autostart", true); // Site isolation
user_pref("keyword.enabled", true); // Autodetect URLs vs search keywords
user_pref("network.cookie.lifetimePolicy", 0);
user_pref("pdfjs.disabled", false);
user_pref("places.history.enabled", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
// user.js has 1, default now 3
user_pref("security.tls.version.min", 3);

user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha", false);
user_pref("security.ssl3.ecdhe_rsa_aes_256_sha", false);
user_pref("security.ssl3.rsa_aes_128_sha", false);
user_pref("security.ssl3.rsa_aes_256_sha", false);
