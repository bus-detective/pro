import Ember from 'ember';
import CampaignReport from 'bd-pro/models/campaign-report';
let { RSVP, inject } = Ember;

export default Ember.Service.extend({
  store: inject.service(),

  build(campaign, params) {
    return this.get('store').query('vehicle', { ids: campaign.get('vehicles').mapBy('id'), start_date: params.startDate, end_date: params.endDate }).then((vehicles) => {
      return CampaignReport.create({
        campaign: campaign,
        vehicles: vehicles
      })
    })
  }
});
