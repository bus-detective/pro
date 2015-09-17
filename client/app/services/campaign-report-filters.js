import Ember from 'ember';
import moment from 'moment';
let { computed, ObjectProxy } = Ember;

export default Ember.Service.extend({
  campaign: null,
  startDate: moment().format("YYYY-MM-DD"),
  endDate: moment().format("YYYY-MM-DD"),

  vehicles: computed.map('campaign.vehicles', function(vehicle) {
    return ObjectProxy.create({ content: vehicle, isSelected: true });
  }),
  selectedVehicles: computed.filterBy('vehicles', 'isSelected', true),
  selectedVehicleIds: computed.mapBy('selectedVehicles', 'id'),

  vehiclePositionsQuery: computed('selectedVehicleIds', function() {
    return {
      campaignId: this.get('campaign.id'),
      startDate: this.get('startDate'),
      endDate: this.get('endDate')
    }
  })
});
