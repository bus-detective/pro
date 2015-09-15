import Ember from 'ember';
import CampaignReport from 'bd-pro/models/campaign-report';
let { RSVP, inject } = Ember;

export default Ember.Service.extend({
  store: inject.service(),

  build(campaign) {
    return this.get('store').query('vehicle', { ids: campaign.get('vehicles').mapBy('id') }).then((vehicles) => {
      return CampaignReport.create({
        campaign: campaign,
        vehicles: vehicles
      })
    })
  }
});

