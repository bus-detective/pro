import Ember from 'ember';
let { inject, run } = Ember;

export default Ember.Service.extend({
  store: inject.service(),

  handleSignInSuccess(session) {
    this.set('model', session);
  },

  signIn(credentials) {
    this.get('store').createRecord('session', credentials).save().then(run.bind(this, 'handleSignInSuccess'));
  }  
});
