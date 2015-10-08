import Ember from 'ember';
let { inject, run, computed } = Ember;

export default Ember.Service.extend({
  session: null,
  user: computed.alias('session.user'),
  store: inject.service(),
  isSignedIn: computed.notEmpty('session'),

  handleSignInSuccess(session) {
    this.set('session', session);
  },

  signIn(credentials) {
    return this.get('store').createRecord('session', credentials).save().then(run.bind(this, 'handleSignInSuccess'));
  }  
});
