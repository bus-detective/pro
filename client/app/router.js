import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('session', function() {
    this.route('new');
  });

  this.route('campaigns', { path: "/" }, function() {
  });

  this.route('campaign', { path: "campaigns/:campaign_id" }, function() {
    this.route('edit');
    this.route('report', function() {});
  });

  this.route('patterns');
});

export default Router;
