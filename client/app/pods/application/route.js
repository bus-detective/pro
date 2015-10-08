import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  currentSession: inject.service(),

  beforeModel() {
    return this.get('currentSession').fetch();
  },

  actions: {
    signOut() {
      this.get('currentSession').signOut().then(() => this.transitionTo('session.new'));
    }
  }
});

