import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    newCampaign() {
      var campaign = this.get('store').createRecord('campaign', {name: "Untitled Campaign"});
      campaign.save().then((campaign) => {
        this.transitionToRoute('campaigns.edit', campaign);
      });
    },

    delete(model) {
      model.destroyRecord().then(() => {
        this.transitionToRoute('campaigns');
      });
    }
  }
});
