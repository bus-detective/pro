import Ember from 'ember';
let { computed } = Ember;

export default Ember.Controller.extend({
  selectedVehicles:  computed.filterBy('model.vehicles', 'isSelected', true),
  selectedVehicleIds:  computed.mapBy('selectedVehicles', 'id'),

  filteresDidChange: Ember.on('init', Ember.observer('selectedVehicles', function() {
    this.transitionToRoute('campaign.report', { queryParams: { vehicleIds: this.get('selectedVehicleIds') } })
  }))
});

