import DS from 'ember-data';
let { attr, belongsTo, hasMany } = DS;

export default DS.Model.extend({
  remoteId: attr('string'),
  product: attr('string'),
  campaign: belongsTo('campaign'),
  vehiclePositions: hasMany('vehiclePositions')
});
