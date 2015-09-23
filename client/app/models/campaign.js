import DS from 'ember-data';
let { attr, hasMany } = DS;

export default DS.Model.extend({
  name: attr('string'),
  vehicles: hasMany('vehicle')
});
