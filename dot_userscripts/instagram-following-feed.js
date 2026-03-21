// ==UserScript==
// @name         Instagram - Auto Redirect to Following Feed
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Automatically redirects the Instagram homepage to the chronological "Following" feed.
// @author       Craig Hill
// @match        https://www.instagram.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=instagram.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Function to check the current URL and redirect if needed
    function checkAndRedirect() {
        // Only redirect if we are exactly on the root homepage without the 'variant=following' parameter
        if (window.location.pathname === '/' && window.location.search !== '?variant=following') {
            // Using replace() so the original homepage doesn't clutter your back button history
            window.location.replace('https://www.instagram.com/?variant=following');
        }
    }

    // 1. Run immediately when the page first loads
    checkAndRedirect();

    // 2. Monitor for URL changes (since Instagram doesn't actually reload the page when you click around)
    let lastUrl = window.location.href;
    const observer = new MutationObserver(() => {
        if (window.location.href !== lastUrl) {
            lastUrl = window.location.href;
            checkAndRedirect();
        }
    });

    // Attach the observer to the document body to watch for background updates
    observer.observe(document.body, { childList: true, subtree: true });

})();
