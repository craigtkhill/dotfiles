// ==UserScript==
// @name         YouTube Sidebar Cleanup
// @namespace    http://tampermonkey.net/
// @version      2.0
// @description  Remove Subscriptions channel list and Explore section from YouTube sidebar, keep the Subscriptions nav button
// @match        https://www.youtube.com/*
// @grant        GM_addStyle
// @author       Craig Hill
// @run-at       document-start
// ==/UserScript==

(function () {
  'use strict';

  // Sections to hide by their heading text (case-insensitive)
  const HIDE_SECTIONS = ['subscriptions', 'explore'];

  function hideSections() {
    // Full sidebar (expanded) — each section has a #guide-section-title
    document.querySelectorAll('ytd-guide-section-renderer').forEach((section) => {
      const title = section.querySelector('#guide-section-title');
      if (title) {
        const text = title.textContent.trim().toLowerCase();
        if (HIDE_SECTIONS.includes(text)) {
          section.style.setProperty('display', 'none', 'important');
        }
      }
    });

    // Collapsible subscription channel list (sometimes rendered separately)
    document.querySelectorAll('ytd-guide-collapsible-section-entry-renderer').forEach((el) => {
      const title = el.querySelector('#guide-section-title');
      if (title && title.textContent.trim().toLowerCase() === 'subscriptions') {
        el.style.setProperty('display', 'none', 'important');
      }
    });
  }

  function init() {
    hideSections();

    // Observe the whole app for YouTube's dynamic rendering / SPA navigation
    const observer = new MutationObserver(hideSections);
    observer.observe(document.documentElement, { childList: true, subtree: true });
  }

  if (document.body) {
    init();
  } else {
    document.addEventListener('DOMContentLoaded', init);
  }
})();
