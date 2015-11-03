import Ember from 'ember';
import CampaignReport from 'bd-pro/models/campaign-report';
let { RSVP, inject, computed, run, ObjectProxy } = Ember;

export default Ember.Service.extend({
  store: inject.service(),
  campaign: null,
  startDate: null,
  endDate: null,

  vehicles: computed.map('campaign.vehicles', function(vehicle) {
    return ObjectProxy.create({ content: vehicle, isSelected: true });
  }),

  query: computed('campaign.id', 'startDate', 'endDate', function(){
    return {
      campaign_id: this.get('campaign.id'),
      start_date: this.get('startDate'),
      end_date: this.get('endDate')
    };
  }),

  fetchReport() {
    return RSVP.hash({
      vehiclePositions: this.get('store').query('vehiclePosition', this.get('query')),
      demographicReports: this.get('store').query('demographicReport', this.get('query')),
      zipCodes: this.get('store').query('zipCode', this.get('query'))
    }).then(run.bind(this, 'buildReport'));
  },

  buildReport(reportData) {
    return CampaignReport.create({
      vehicles: this.get('vehicles'),
      vehiclePositions: reportData.vehiclePositions,
      zipCodes: reportData.zipCodes,
      demographicReports: reportData.demographicReports
    });
  }
});
