import DS from 'ember-data';
let { attr } = DS;

export default DS.Model.extend({
  name: attr('string'),
  key: attr('string'),
  group: attr('string'),
  color: attr('string'),
  value: attr('number'),
});
