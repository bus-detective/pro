import Ember from 'ember';
import CampaignReport from 'bd-pro/models/campaign-report';
let { inject, RSVP } = Ember;

export default Ember.Service.extend({
  store: inject.service(),

  build(campaignReportFilters) {
    return this.get('store').query('vehiclePosition', campaignReportFilters.get('vehiclePositionsQuery')).then((vehicles) => {
      return CampaignReport.create({vehiclesPositions: vehiclesPositions});
    });
  }
});
