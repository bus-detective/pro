import Ember from 'ember';
let { inject, run } = Ember;

export default Ember.Route.extend({
  currentSession: inject.service(),

  model: function() {
    return { email: "", password: "" };
  },

  handleSuccess() {
    this.transitionTo('campaigns');
  },

  handleError() {
    alert("Invalid email or password");
  },

  actions: {
    signIn(credentials) {
      this.get('currentSession').signIn(credentials).then(run.bind(this, 'handleSuccess'), run.bind(this, 'handleError'));
    }
  }
});

