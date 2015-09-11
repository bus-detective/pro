import DS from 'ember-data';
let { attr, hasMany } = DS;
let { computed } = Ember;

export default DS.Model.extend({
  name: attr('string'),
  vehicles: hasMany('vehicle'),
  vehicleIds: computed.mapBy('vehicles', 'id')
});
