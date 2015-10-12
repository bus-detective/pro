import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportBuilder: inject.service(),

  model() {
    let campaignReportBuilder = this.modelFor('campaign.report');
    return campaignReportBuilder.fetchReport();
  }
});

