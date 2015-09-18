import Ember from 'ember';
import moment from 'moment';
import CampaignReport from 'bd-pro/models/campaign-report';
let { inject, computed, run, ObjectProxy } = Ember;

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
    return this.get('store').query('vehiclePosition', this.get('query')).then(run.bind(this, 'buildReport'));
  },

  buildReport(vehiclePositions) {
    return CampaignReport.create({
      vehicles: this.get('vehicles'),
      vehiclePositions: vehiclePositions
    });
  }
});
