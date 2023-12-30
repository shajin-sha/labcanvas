'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "c9582b300f3ee91d872e640631be50e3",
"index.html": "c223616147072b85bd2d2c69f4791017",
"/": "c223616147072b85bd2d2c69f4791017",
"main.dart.js": "6289552d030b66b7497e3c831b7b3136",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "23b659290bb2098d0db74b899ca96579",
"icons/Icon-192.png": "4f55e4275089e4957c049c0a949762a7",
"icons/Icon-maskable-192.png": "4f55e4275089e4957c049c0a949762a7",
"icons/Icon-maskable-512.png": "2225fea2e6c934af462d3dc81faf7e7f",
"icons/Icon-512.png": "2225fea2e6c934af462d3dc81faf7e7f",
"manifest.json": "0f777478303e8c833ea12caa1224135f",
".git/config": "b8f9dbaa7916cbb695f694ce53dcb979",
".git/objects/95/ad3674455e1dfbab5be82b534deafe34994287": "2a53a2ae68384e622af8b911f5fd5f35",
".git/objects/03/8ce498f30a1f5a482ea65ffe68b24891843701": "382de149332c8cf5189f00215d516f66",
".git/objects/9e/430b89328bd4fd188c0f4e329406a6654c901e": "21d253f507d9286c47860369a77f36e6",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/6a/e1bdd14d56ff5625558d72458bdc610c6a04b8": "621fdc77c1dac40744c2bbca94926809",
".git/objects/3d/8d675a9c3a7120e37c6d296d30c5749d4d498c": "a7a5dfcc3e7e958a3a829465ad81d707",
".git/objects/58/a8a832f0135d0cd28d7b20555f219c853351cd": "c29fafa18ba7850ee703fa64025f528a",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/b2/f8291e9165798a6a7f3258f1db299411c9b177": "8a21384e1e4826434ca88868b3d22533",
".git/objects/ac/6ed92d2b8eaade44db9d509dfd716ffffe2482": "1f3dda8207623fc5af1639cbedfc928f",
".git/objects/ad/7d8eab89f5acbf7dea1dd36463c75066cc9540": "0f91636994b2417f5a2e9d3510a98fbf",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/df/3afe3e73ff50331ea56325c61b9941cb92bc5c": "54c1659bc540d8ce0a11cd0a38646c57",
".git/objects/a5/0030df05c67adcffb55a682997b7a17db971af": "78b6ea7b9f04d17194fc6f07765fadf9",
".git/objects/ae/d8d9a282f5799d3e07a7cffcb32ba8b9231dcb": "8b9c69d2cb296603f095a2cff64d320f",
".git/objects/ae/14f18d6fe616e6844a25ff5661f6fcfb74984f": "c83d68fe5e0f4404709822788218a4b3",
".git/objects/ab/359e56fe2d5b082c912dec56244ac1008205e6": "ad6331daa152c17ca012f41dd2f570f4",
".git/objects/fc/f79b128dcc6baae616081c95fdf5096dd35d44": "fd8e0a6c8dc7f6fc82635fbe3a6f131f",
".git/objects/f5/aebbd5ea1c506359b56f8a2d14406fed34e78e": "1f93909b1b0e1e0a22e2eac9aa0fde1a",
".git/objects/e4/8377527f0c258bfe2d6888b571022a8dbc9c3c": "664bab928d54c829a32478c5a071c03c",
".git/objects/c8/b637015c4a8e7cb3a77ee1b1571be893bba9c1": "9d7e304f92df3f2df7bb4d4b8fe705a9",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/4b/08c92a6448f807045994c6de22d8ee9093aaab": "73d0aae290bed3c22142aa1a7a3ba56f",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/9f/7f931f7348ae0358911e6bab46d8fb573586c3": "853e700c4cb824e5fa2fb831731f04be",
".git/objects/6b/38923caf1699bf0256e5b7cde1ec66939b93d8": "32e445652eea6899915c11ea635ca87a",
".git/objects/6e/5b09d5a16ddd3f7e3f04cf18100a5d6a98b9a0": "b4c449396a223ed11682c1a881745895",
".git/objects/6e/8e779a4e60019fd942152184554a263439d7aa": "d18823ed2a9dcaf70d2e3ea0f94419c3",
".git/objects/5c/c6b490a6d2abcb3104cd22d8091b93110b3719": "d4c8ffaa5603b7e1787b74cceb0cd761",
".git/objects/5c/dac9ca591a2705844030915ac2b727141fa287": "85ca7297faab300642e4466cd150fa22",
".git/objects/30/0dee2bc6cfeab2fbdd5f19f6b76dd3cb149e7a": "5a76142988832a0f2a672b2cbd198cfe",
".git/objects/90/15f67d889e9c814aa4c79176b4ede1a16d6488": "fcfa9327f630ad0db285ce86aa865158",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/de/a8fbbc5355d2fa249e3a6252358956f5206cb1": "5a2945048dc5bf5aa51c3bb2597fd1c0",
".git/objects/ea/e5015c9b16fa087639a2b8dad46e0e38c08957": "64ea894ba9ad79e45a9b46562c4d8ca0",
".git/objects/ea/861d37d058ce8cd9273e22b5fa8b0d9c5b906c": "fd0f61438f8ae0e4831071a3ca7399aa",
".git/objects/ea/8c7db11d7b8c6242aef7fd2961cdd90cb32fbf": "62943b8215d5632efd068cfaa3192bc5",
".git/objects/e1/2c7169701cae11e014f495c12253b01bb46bec": "0667133d8528795f559cfbb70536b15f",
".git/objects/fa/8595afc90f292c9e96438ef49d81690e87ca13": "ce854502937f399e7f553143085faead",
".git/objects/ff/a3571977d09148094e18f89fa04feeaabcd8b3": "f42d070e7d535abe41b579f8beace329",
".git/objects/77/bf196aacdbfdda063d336bc7c858f3d86835f1": "9652df33ffcd67b4719bc8b907a45e8d",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/8d/b48618619606b349b6157d61a03b207579bb40": "c4b641be980a5cfea053426e7cf43558",
".git/objects/85/657f4a65e9b83b09bf3a97a9427843f071dab9": "95bb9b8baf5b91bf64b3b8e912d147f0",
".git/objects/1d/164642b17031129b2751bbaaa468646b548b02": "45fd1561171007912eaa5475b12165c1",
".git/objects/71/bfc1ae38f54098a0bd031ef3cbc7f3d5796773": "e758f3e4c47a77798959c05c33cb97b2",
".git/objects/1c/b7088fbc593ba7271458ff1f538c1e126e3241": "289b377ffd9570d42b9cbc56eb425220",
".git/objects/49/71f8a056e1b0a6f8b07a8fa522a5fa59c4f0c4": "d389925d6908f90d20d03e0552084f5f",
".git/objects/2e/7195e5c23517ea8d292917b116d5ea306fc5a2": "12bfcea3e27405d18347f2666deb0036",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/78/5784183ecb7339ef7349914837bad5e4eefb34": "5b9d125d612d95af39b062a6e7f373d1",
".git/objects/8b/e2a1326dd296a88e22ba3f08dc59c5ca95c561": "de721882c1ccc1279ab8867f344b19b5",
".git/objects/7f/16fa90d8d0557f919b0776bd4984a0d8ee2f73": "0c77c46eda37c5c5e6459e73125e4d8e",
".git/objects/22/02f911e4a84ccb515a59d91af7ce94dbc236ce": "aa9e762005d734c2ddc44bdbe161bd03",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d4865352f29ff345eeb9b4859de51825",
".git/logs/refs/heads/main": "d4865352f29ff345eeb9b4859de51825",
".git/logs/refs/remotes/origin/main": "d686e7f43e41e8b487ee4365476bf9f5",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "768cea652e4c243bea47a2d5f591220a",
".git/refs/remotes/origin/main": "768cea652e4c243bea47a2d5f591220a",
".git/index": "ed905bbdbcd35840ccbad681419ed6c1",
".git/COMMIT_EDITMSG": "26d62ceeea703c097352ee83be85138f",
"assets/AssetManifest.json": "306e9f853704d481ab537b1d811380b0",
"assets/NOTICES": "f73f88976b96aa7f283c494cc5d98d8c",
"assets/FontManifest.json": "1a6184c6ca656e8be25d25329c87e502",
"assets/AssetManifest.bin.json": "4621357b8bca7311c449c64c7a19c6bd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f36cbf9b550cd10ab5e21af7daa40a2f",
"assets/packages/feather_icons/fonts/feather.ttf": "0d0d92d310cc68e53796bf15c36838c2",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "638928658add506bda425941b699b532",
"assets/fonts/MaterialIcons-Regular.otf": "8c8f478a62091ebf4afe051afe81ccec",
"assets/assets/times_new_roman.ttf": "e2f6bf4ef7c6443cbb0ae33f1c1a9ccc",
"assets/assets/times_new_roman_italic.ttf": "e3d6e9ea74f51afbfc9071e214ddb9e8",
"assets/assets/arial.ttf": "fe6b41f2c2d2c7655ec1e44520667a13",
"assets/assets/times_new_roman_bold.ttf": "1d3466fec8a99ed65f32cbdfb3d5c4d0",
"assets/assets/times_new_roman_bold_italic.ttf": "85950e39e82115c6eab24d91fc1b7723",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
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
