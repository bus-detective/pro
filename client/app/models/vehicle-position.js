import DS from 'ember-data';
let { attr } = DS;

export default DS.Model.extend({
  vehicleRemoteId: attr('string'),
  lat: attr('number'),
  lng: attr('number'),
  timestamp: attr('date')
});
