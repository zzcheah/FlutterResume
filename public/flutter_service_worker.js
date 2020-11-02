'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "e2af6bc238ddd64764da1667cecada2e",
"assets/assets/avatar.jpg": "fa4d79a26629faca2e32b85b15a02567",
"assets/assets/dsc.png": "85233d7993f3c45064ef91161c74e744",
"assets/assets/gcp.png": "791a20b9bef09b21a04f6f454e84fd9e",
"assets/assets/kln.jpg": "32809986ba7936e5e18cc82bdd4a26bc",
"assets/assets/pbtj.png": "e3505322738d7f464309a3249e0aaca4",
"assets/assets/qwiklabs/0.png": "743a83cef5f6d5f1b7032a69aa543549",
"assets/assets/qwiklabs/1.png": "ff3766b2817634e87308d4f252fd9fb6",
"assets/assets/qwiklabs/10.png": "b561bf3035a214560647784050df5362",
"assets/assets/qwiklabs/11.png": "0b78446fb7c6cf1fe46377bb9c3a0b01",
"assets/assets/qwiklabs/12.png": "844cf44425b999985260b0524b341816",
"assets/assets/qwiklabs/13.png": "4d2d01af3a8764b7fb6753945ec1ecc1",
"assets/assets/qwiklabs/14.png": "faab2f0625c4589def84eefd04e0253e",
"assets/assets/qwiklabs/15.png": "736cdab7a2758697126abfaa5c6769ae",
"assets/assets/qwiklabs/2.png": "c7b7cc717f4df6e6620029f3136557e2",
"assets/assets/qwiklabs/3.png": "d06f447c2d3a1c5970305cd7adfdb872",
"assets/assets/qwiklabs/4.png": "03461f2dfc64949507fb6e53a3b729f8",
"assets/assets/qwiklabs/5.png": "8506c265ef9c81f6ecbd2e2cf0c4870f",
"assets/assets/qwiklabs/6.png": "c7a92035de370f035b82b7308d1d1789",
"assets/assets/qwiklabs/7.png": "c818ae346b93a519658f03b1f96505be",
"assets/assets/qwiklabs/8.png": "afa40aa73a3997b0a78f4a54fd44024c",
"assets/assets/qwiklabs/9.png": "9509f9acf583a3f9925e8d2e57ab35c2",
"assets/assets/usm.png": "2b840b4a591ca68cb45a63dea22645e7",
"assets/FontManifest.json": "1b1e7812d9eb9f666db8444d7dde1b20",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "a0e7e55c48939ea0bcfde6072ddac882",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "c1242726c7eac4eb5e843d826f78fb1b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "aa5e628ee5bb8247276d7393b7e369bf",
"/": "aa5e628ee5bb8247276d7393b7e369bf",
"main.dart.js": "ac5bd8d1f5e32bb4573ee744e7b1b35e",
"manifest.json": "07d5a97179e3d892af1fe813a0b4deb0",
"version.json": "cf30a5d15f9f8c3a37388a2051c1a39a"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
