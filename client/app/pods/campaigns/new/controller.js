import Ember from 'ember';

export default Ember.Controller.extend({
  campaign: null,
  actions: {
    save() {
      var campaign = this.get('store').createRecord('campaign', {
        name: this.get('model.name')
      });
      this.set('campaign', campaign);

      campaign.save().then(() => {
        this.transitionToRoute('campaigns');
      });
    },

    cancel() {
      var campaign = this.get('campaign');
      campaign.get('errors').clear();
      this.transitionToRoute('campaigns');
    }
  }
});
