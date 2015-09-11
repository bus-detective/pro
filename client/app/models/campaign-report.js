import Ember from 'ember';
let { computed } = Ember;

export default Ember.Object.extend({
  addVehicleId(id) {
    this.get('selectedVehicleIds').push(id);
  },

  removeVehicleId(id) {
    this.set('selectedVehicleIds', this.get('selectedVehicleIds').without(id))
  }
});
