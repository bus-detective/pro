import DS from 'ember-data';
let { attr } = DS;

export default DS.Model.extend({
  name: attr(),
  email: attr()
});
