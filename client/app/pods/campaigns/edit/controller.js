import Ember from 'ember';

export default Ember.Controller.extend({
  campaign: Ember.computed.alias('model'),
  actions: {
    save() {
      var campaign = this.get('model');
      campaign.save().then(() => {
        this.transitionToRoute('campaigns');
      });
    },

    cancel() {
      this.get('model').rollbackAttributes();
      this.transitionToRoute('campaigns');
    }
  }
});
