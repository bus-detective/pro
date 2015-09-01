import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('session', { path: "/" }, function() {
    this.route('new', { path: "sign-in" });
  });
});

export default Router;
