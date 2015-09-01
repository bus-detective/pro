import Ember from 'ember';
let inject = Ember.inject;

export default Ember.Route.extend({
  currentSession: inject.service(),

  model: function() {
    return { email: "", password: "" };
  },

  actions: {
    signIn(credentials) {
      this.get('currentSession').signIn(credentials)
    }
  }
});

