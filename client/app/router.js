import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('session', { path: "/" }, function() {
    this.route('new', { path: "sign-in" });
  });

  this.route('campaigns', { path: "/" }, function() {
    this.route('edit', { path: "/campaigns/:campaign_id/edit" });
  });

  this.route('campaign', { path: "campaigns/:campaign_id" }, function() {
    this.route('report', function() {});
  });

  this.route('patterns');
});

export default Router;
