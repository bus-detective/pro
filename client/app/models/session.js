import DS from 'ember-data';
let { attr, belongsTo } = DS;

export default DS.Model.extend({
  email: attr(),
  password: attr(),
  token: attr(),
  user: belongsTo('user')
});
