import Ember from 'ember';
let { observes } = Ember;

export default Ember.Controller.extend({
  campaign: Ember.computed.alias('model'),
  definePageTitle: function() {
    Ember.defineProperty(this, 'title');

    if(this.get('campaign.name') == '') {
      this.set('title', 'New Campaign');
    } else {
      this.set('title', 'Edit ' + this.get('campaign.name'));
    }
  }.observes('campaign'),

  setCampaignBlank: function() {
    this.set('campaign.name', '');
  }.observes('campaign'),

  actions: {
    save() {
      var campaign = this.get('model');
      campaign.save().then(() => {
        this.transitionToRoute('campaigns');
      });
    },

    cancel() {
      this.get('model').destroyRecord();
      if(this.get('model.isDeleted')) {
        this.transitionToRoute('campaigns');
      }
    }
  }
});
