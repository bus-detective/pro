import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save() {
      var campaign = this.get('model');
      campaign.save().then(() => {
        this.transitionToRoute('campaigns');
      }, (error) => {
        campaign.rollbackAttributes();
      });
    },

    cancel() {
      this.transitionToRoute('campaigns');
    }
  }
});
