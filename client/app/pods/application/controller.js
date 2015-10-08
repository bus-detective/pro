import Ember from 'ember';
let { inject } = Ember;

export default Ember.Controller.extend({
  currentSession: inject.service()
});

