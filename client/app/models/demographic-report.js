import DS from 'ember-data';
import Ember from 'ember';
let { attr } = DS;
let { computed } = Ember;

export default DS.Model.extend({
  name: attr('string'),
  key: attr('string'),
  group: attr('string'),
  value: attr('number'),
});
