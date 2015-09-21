/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

function isEnvironment(env) {
  return process.env.EMBER_ENV === env;
}

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    fingerprint: {
      prepend: 'https://busdetective-pro.s3.amazonaws.com/'
    },
    minifyCSS: {
      enabled: isEnvironment("production")
    },
    minifyJS: {
      enabled: isEnvironment("production")
    },
    tests: isEnvironment("development") || isEnvironment("test"),
    hinting: isEnvironment("development") || isEnvironment("test")
  });

  app.import('bower_components/leaflet/dist/leaflet-src.js');
  app.import('bower_components/leaflet/dist/leaflet.css');

  return app.toTree();
};
