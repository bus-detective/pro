import Ember from 'ember';
let { computed, ObjectProxy } = Ember;

export default Ember.Object.extend({
  vehicleFilters: computed.map('vehicles', (vehicle) => {
    return ObjectProxy.create({ content: vehicle, isSelected: true });
  }),
  selectedVehicles:  computed.filterBy('vehicleFilters', 'isSelected', true),
  selectedVehicleIds:  computed.mapBy('selectedVehicles', 'id')
});
