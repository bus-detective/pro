import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportBuilder: inject.service(),

  model() {
    return this.get('campaignReportBuilder').build(this.modelFor('campaign'));
  }
});
