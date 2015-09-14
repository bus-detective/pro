import Ember from 'ember';
import CampaignReport from 'bd-pro/models/campaign-report';
let { inject } = Ember;

export default Ember.Service.extend({
  store: inject.service(),

  build(campaign) {
    return CampaignReport.create({
      campaign: campaign,
      vehicles: this.get('store').query('vehicle', { ids: campaign.get('vehicles').mapBy('id') })
    });
  }
});

