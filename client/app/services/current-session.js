import Ember from 'ember';
let { inject, run, computed } = Ember;

export default Ember.Service.extend({
  session: null,
  user: computed.alias('session.user'),
  store: inject.service(),
  isSignedIn: computed.notEmpty('session'),

  handleSignIn(session) {
    this.set('session', session);
  },

  handleSignOut() {
    this.set('session', null);
  },

  signIn(credentials) {
    return this.get('store').createRecord('session', credentials).save().then(run.bind(this, 'handleSignIn'));
  },

  signOut() {
    return this.get('session').destroyRecord().then(run.bind(this, 'handleSignOut'));
  },

  fetch() {
    return this.get('store').find('session', 'current').then(
      run.bind(this, 'handleSignIn'),
      run.bind(this, 'handleSignOut')
    );
  }
});
