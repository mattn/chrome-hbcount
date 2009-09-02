if (window == top) {
  var port = chrome.extension.connect();
  port.onMessage.addListener(function(data) {
    location.href = data.url;
  });
  port.postMessage({url: location.href});
}
