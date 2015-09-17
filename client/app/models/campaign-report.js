import Ember from 'ember';
let { computed } = Ember;

export default Ember.Object.extend({
  vehicles: [],
  vehiclePositions: [],
  selectedVehicles: computed.filterBy('vehicles', 'isSelected', true),

  selectedVehiclePositions: computed('selectedVehicles', function() {
    let selectedVehicleRemoteIds = this.get('selectedVehicles').mapBy('remoteId');
    return this.get('vehiclePositions').filter((vehiclePosition) => {
      return selectedVehicleRemoteIds.contains(vehiclePosition.get('vehicleRemoteId'));
    });
  })
});
