'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "966386ff3627bec6a16ad6cdc28a0d27",
"version.json": "2d15818f78766d29e0eaa67f889cbc51",
"index.html": "a491acbd0aece553c89bb25e42e2af5d",
"/": "a491acbd0aece553c89bb25e42e2af5d",
"main.dart.js": "510bc363cb5e2cf0cea8eef6f8912212",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "50871e666a357728056180331108ddc1",
"icons/Icon-192.png": "1c412e2674ff8650532a8695f77a6d33",
"icons/Icon-maskable-192.png": "ec5ca9bb844dd57e5529b28cf9304cac",
"icons/Icon-maskable-512.png": "09d9087d5c7b4e79cdbf177bfa9599ca",
"icons/Icon-512.png": "f318a418a93849e3ec8cb315ac96f556",
"manifest.json": "9d89a030210252ad3f6d2bbb1ec4fc57",
"assets/AssetManifest.json": "ee8730974c8682185a5672a97fbcfec5",
"assets/NOTICES": "79d9dba821c65fecd99fbcbbcf618a71",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "7dd0dde26aecc40641db278bffbad185",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "8fd6751c7b6e3b85e858485a9b672967",
"assets/fonts/MaterialIcons-Regular.otf": "f5db3cec0a1d23f80079e5ed217838e3",
"assets/assets/svg/github.svg": "6a198d89e22d98a693dcd8d5a2e3f87a",
"assets/assets/svg/x.svg": "46b192b6843549149f1ebba8280151f5",
"assets/assets/svg/linkdln.svg": "352e168faaaa9d15347699b7e8f62ccd",
"assets/assets/svg/email.svg": "a799d211630867e63e60ce2ca5019f73",
"assets/assets/svg/world.svg": "be54778fd6152adf3827c47de7715f5a",
"assets/assets/images/me.jpg": "f6021125d061656d1864d5cf6b2b2c5a",
"assets/assets/images/r5.jpg": "8df00f4bd623a215dfa079d5eede35c0",
"assets/assets/images/verifik.png": "4047d8925b45805ef0493f1f28d7fa38",
"assets/assets/images/proveedores.png": "d94f3ce5ca74ff11e4ca7afc0aeb77cc",
"assets/assets/images/yugioh.jpg": "3fd53e6a9ca380dd9cfae77a911166f3",
"assets/assets/animations/loading/developer.json": "3bdac578c8b76ca83ddbb48d5f0f63b3",
"assets/assets/animations/loading/wasap.json": "7fc47f650e20a707774c959ebe47f2a8",
"assets/assets/animations/loading/linkdln.json": "ed53ffb2e59f5a64196c2dd0b3744edb",
"assets/assets/animations/loading/tap.json": "7c3c364ff594beec29be856298648fba",
"assets/assets/animations/loading/drawer_animation.json": "2be681a641948d1af2e4c07810e1dd69",
"assets/assets/animations/loading/email.json": "40cd266a5d76a9e7bfc665820ac9598b",
"assets/assets/animations/loading/github.json": "24dec41d23206e051d06df24466854ea",
"assets/assets/gif/breedcat.gif": "04c21e18b7cd4dfba256db6a1381bcfb",
"assets/assets/gif/conductor.gif": "3303514ef2131d309e508e31789301c9",
"assets/assets/gif/tul.gif": "d47509ae99848dddad1569030281bf03",
"assets/assets/gif/yugioh.gif": "2d4cafaaca5d937a2770e1b16d878d26",
"assets/assets/gif/acacompro.gif": "76798fde8f3e77a074e6e9156865a02a",
"assets/assets/gif/cliente.gif": "d626784186127b2e7eb278e81b0e621f",
"assets/assets/gif/somosjunior.gif": "7b9e859113049b32e37a07240a4c5d8a",
"assets/assets/gif/R5.gif": "083edb21f91b0d7b58bb39a8f9489379",
"assets/assets/gif/verifik.gif": "79489a5a5c35114d4024d427c06c1f37",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
  for (var resourceKey of Object.keys(RESOURCES)) {
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
