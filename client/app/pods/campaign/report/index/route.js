import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportBuilder: inject.service(),

  model() {
    let campaignReportFilters = this.modelFor('campaign.report');
    return this.get('campaignReportBuilder').build(campaignReportFilters);
  }
});

