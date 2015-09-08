import DS from 'ember-data';
let { attr, belongsTo, hasMany } = DS;

export default DS.Model.extend({
  title: attr('string'),
  campaign: belongsTo('campaign'),
  vehiclePositions: hasMany('vehiclePosition')
});
