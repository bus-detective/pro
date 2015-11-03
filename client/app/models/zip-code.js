import DS from 'ember-data';
let { attr } = DS;

export default DS.Model.extend({
  code: attr('string'),
  count: attr('number'),
  shape: attr()
});
