import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    this.get('store').query('report', { campaign_id: this.modelFor('campaign').get('id') });
  }
});
