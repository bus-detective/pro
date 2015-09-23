import DS from 'ember-data';
let { attr, hasMany } = DS;

export default DS.Model.extend({
  remoteId: attr('string'),
  product: attr('string'),
  vehiclePositions: hasMany('vehiclePositions')
});
