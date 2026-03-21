// ==UserScript==
// @name         Clean YouTube Subscriptions
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Hides Shorts and injected suggestions on the Sub page.
// @match        https://www.youtube.com/*
// @author       Craig Hill
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    const cleanFeed = () => {
        // Safety check: Only run this logic if we are actually on the subscriptions page
        if (!window.location.href.includes('/feed/subscriptions')) return;

        // TARGET 1: Entire "Shelves" (This catches the horizontal Shorts rows and recommendation blocks)
        const shelves = document.querySelectorAll('ytd-rich-section-renderer, ytd-reel-shelf-renderer');
        shelves.forEach(shelf => {
            if (shelf.style.display !== 'none') shelf.style.display = 'none';
        });

        // TARGET 2: Individual Shorts mixed into the main video grid
        // This looks for any video container that has a "SHORTS" overlay inside it
        const individualShorts = document.querySelectorAll('ytd-rich-item-renderer:has([overlay-style="SHORTS"])');
        individualShorts.forEach(short => {
            if (short.style.display !== 'none') short.style.display = 'none';
        });
    };

    // Run once immediately when the page loads
    cleanFeed();

    // The MutationObserver: Keeps watching the page as you scroll to catch new items
    const observer = new MutationObserver(cleanFeed);
    observer.observe(document.body, { childList: true, subtree: true });
})();
