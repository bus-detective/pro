import Ember from 'ember';
import CampaignReport from 'bd-pro/models/campaign-report';
let { inject } = Ember;

export default Ember.Service.extend({
  store: inject.service(),

  build(options) {
    return CampaignReport.create({
      vehiclePositions: this.get('store').query('vehiclePosition', { vehicle_ids: options.vehicleIds })
    });
  }
});

