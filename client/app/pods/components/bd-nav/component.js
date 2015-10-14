import Ember from 'ember';

export default Ember.Component.extend({
  isExpanded: false,
  actions: {
    toggleExpanded() {
      this.toggleProperty("isExpanded");
    },

    signOut() {
      this.sendAction('onSignOut');
    }
  }
});
