import Ember from 'ember';
let { computed } = Ember;

export default Ember.Controller.extend({
  queryParams: ['vehicleIds'],
  vehicleIds: "",

  filteresDidChange: Ember.on('init', Ember.observer('selectedVehicles', function() {
    this.transitionToRoute('campaign.report', { queryParams: { vehicleIds: this.get('selectedVehicleIds') } })
  }))
});

