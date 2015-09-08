import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.get('store').find('report', this.modelFor('campaign').get('id'));
  }
});
