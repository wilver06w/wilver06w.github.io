'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "687cb8743920d2aa56cd5dbfe2f3ec7b",
"assets/AssetManifest.bin.json": "d33a5be2f756be05511e490ad61c8829",
"assets/AssetManifest.json": "4b1b1d5adedc1b356dba2ce7a3756170",
"assets/assets/animations/loading/developer.json": "3bdac578c8b76ca83ddbb48d5f0f63b3",
"assets/assets/animations/loading/drawer_animation.json": "2be681a641948d1af2e4c07810e1dd69",
"assets/assets/animations/loading/email.json": "40cd266a5d76a9e7bfc665820ac9598b",
"assets/assets/animations/loading/github.json": "24dec41d23206e051d06df24466854ea",
"assets/assets/animations/loading/linkdln.json": "ed53ffb2e59f5a64196c2dd0b3744edb",
"assets/assets/animations/loading/tap.json": "7c3c364ff594beec29be856298648fba",
"assets/assets/animations/loading/wasap.json": "7fc47f650e20a707774c959ebe47f2a8",
"assets/assets/gif/acacompro.gif": "76798fde8f3e77a074e6e9156865a02a",
"assets/assets/gif/cliente.gif": "d626784186127b2e7eb278e81b0e621f",
"assets/assets/gif/conductor.gif": "3303514ef2131d309e508e31789301c9",
"assets/assets/gif/R5.gif": "083edb21f91b0d7b58bb39a8f9489379",
"assets/assets/gif/somosjunior.gif": "7b9e859113049b32e37a07240a4c5d8a",
"assets/assets/gif/tul.gif": "d47509ae99848dddad1569030281bf03",
"assets/assets/gif/verifik.gif": "79489a5a5c35114d4024d427c06c1f37",
"assets/assets/gif/yugioh.gif": "2d4cafaaca5d937a2770e1b16d878d26",
"assets/assets/images/me.jpg": "f6021125d061656d1864d5cf6b2b2c5a",
"assets/assets/images/proveedores.png": "d94f3ce5ca74ff11e4ca7afc0aeb77cc",
"assets/assets/images/r5.jpg": "8df00f4bd623a215dfa079d5eede35c0",
"assets/assets/images/verifik.png": "4047d8925b45805ef0493f1f28d7fa38",
"assets/assets/images/yugioh.jpg": "3fd53e6a9ca380dd9cfae77a911166f3",
"assets/assets/svg/email.svg": "a799d211630867e63e60ce2ca5019f73",
"assets/assets/svg/github.svg": "6a198d89e22d98a693dcd8d5a2e3f87a",
"assets/assets/svg/linkdln.svg": "352e168faaaa9d15347699b7e8f62ccd",
"assets/assets/svg/world.svg": "be54778fd6152adf3827c47de7715f5a",
"assets/assets/svg/x.svg": "46b192b6843549149f1ebba8280151f5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "92ba5c39f373789f5a26a1d2b1734b1d",
"assets/NOTICES": "7a86bbc260befb2682e8fccd17118c06",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "50871e666a357728056180331108ddc1",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "1c412e2674ff8650532a8695f77a6d33",
"icons/Icon-512.png": "f318a418a93849e3ec8cb315ac96f556",
"icons/Icon-maskable-192.png": "ec5ca9bb844dd57e5529b28cf9304cac",
"icons/Icon-maskable-512.png": "09d9087d5c7b4e79cdbf177bfa9599ca",
"index.html": "229071b90c3ced17f4a8c83b4f9ab345",
"/": "229071b90c3ced17f4a8c83b4f9ab345",
"main.dart.js": "bc7ebc849004608afafb55a37fa23597",
"manifest.json": "1e70c1a43998e5fb40e573eca86a3b3b",
"version.json": "2d15818f78766d29e0eaa67f889cbc51"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
