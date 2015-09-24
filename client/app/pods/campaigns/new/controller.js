import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save(campaign) {
      var campaign = this.get('store').createRecord('campaign', {
        name: this.get('model.name')
      });

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
