import Ember from 'ember';
let { inject } = Ember;

export default Ember.Mixin.create({
  currentSession: inject.service(),

  beforeModel(transition) {
    if (!this.get('currentSession.isSignedIn')) {
      transition.abort();
      this.transitionTo('session.new');
    } else {
      return this._super(...arguments);
    }
  }
});
