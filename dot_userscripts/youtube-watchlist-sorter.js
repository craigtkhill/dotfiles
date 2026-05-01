// ==UserScript==
// @name         YouTube WL Sorter
// @namespace    http://tampermonkey.net/
// @version      2.2
// @description  Permanently reorders WL by simulating "Move to Top" actions
// @author       Craig Hill
// @match        *://*.youtube.com/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const delay = (ms) => new Promise(res => setTimeout(res, ms));

    function getVideos() {
        const container = document.querySelector('ytd-playlist-video-list-renderer #contents');
        if (!container) return [];
        return Array.from(container.querySelectorAll('ytd-playlist-video-renderer')).map(v => {
            const timeStr = v.querySelector('span.ytd-thumbnail-overlay-time-status-renderer')?.innerText || "0:00";
            const parts = timeStr.trim().split(':').map(Number);
            const seconds = parts.length === 3 ? (parts[0] * 3600) + (parts[1] * 60) + parts[2] : (parts[0] * 60) + parts[1];
            return { element: v, seconds, title: v.querySelector('#video-title')?.title || '' };
        });
    }

    async function scrollToLoadAll() {
        const btn = document.getElementById('sort-status-btn');
        if(btn) btn.innerText = "Loading all videos...";
        let prev = 0;
        while (true) {
            window.scrollTo(0, document.documentElement.scrollHeight);
            await delay(800);
            const count = document.querySelectorAll('ytd-playlist-video-renderer').length;
            if (count === prev) break;
            prev = count;
        }
        window.scrollTo(0, 0);
        await delay(500);
    }

    async function startPermanentSort() {
        await scrollToLoadAll();

        const sorted = getVideos().sort((a, b) => b.seconds - a.seconds);
        const titleOrder = sorted.map(v => v.title);

        console.log("Starting permanent reorder...");
        const btn = document.getElementById('sort-status-btn');

        for (let i = 0; i < titleOrder.length; i++) {
            const targetTitle = titleOrder[i];
            if(btn) btn.innerText = `Processing ${i + 1}/${titleOrder.length}: ${targetTitle.substring(0, 30)}...`;

            const freshVideos = getVideos();
            const match = freshVideos.find(v => v.title === targetTitle);
            if (!match) {
                console.warn("Could not find video: " + targetTitle);
                continue;
            }

            match.element.scrollIntoView({ behavior: "instant", block: "center" });
            await delay(50);

            const menuBtn = match.element.querySelector('button[aria-label="Action menu"]');
            if (!menuBtn) {
                console.warn("No menu button for: " + targetTitle);
                continue;
            }
            menuBtn.click();

            await delay(100);

            const menuOptions = Array.from(document.querySelectorAll('ytd-menu-service-item-renderer'));
            const moveTop = menuOptions.find(el => el.textContent.includes("Move to top"));

            if (moveTop) {
                moveTop.click();
                await delay(600);
            } else {
                console.warn("No 'Move to top' for: " + targetTitle);
                document.body.click();
                await delay(100);
            }
        }

        alert("Sorting complete!");
        location.reload();
    }

    function manageButtonVisibility() {
        const isWatchLaterPage = window.location.href.includes('list=WL');
        let btn = document.getElementById('sort-status-btn');

        if (isWatchLaterPage) {
            if (!btn) {
                btn = document.createElement('button');
                btn.id = 'sort-status-btn';
                btn.innerText = "START SORT";
                btn.style = "position:fixed;top:100px;right:20px;z-index:9999;padding:15px;background:#cc0000;color:white;border:none;cursor:pointer;font-weight:bold;border-radius:4px;box-shadow:0 4px 10px rgba(0,0,0,0.3);";
                btn.onclick = startPermanentSort;
                document.body.appendChild(btn);
            }
        } else {
            if (btn) {
                btn.remove();
            }
        }
    }

    manageButtonVisibility();
    window.addEventListener('yt-navigate-finish', manageButtonVisibility);
})();
