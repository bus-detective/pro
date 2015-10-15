import DS from 'ember-data';
import Ember from 'ember';
let { attr } = DS;
let { computed } = Ember;

export default DS.Model.extend({
  name: attr('string'),
  value: attr('number')
});
