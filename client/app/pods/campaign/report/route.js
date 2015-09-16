import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  queryParams: {
    startDate: { refreshModel: true },
    endDate: { refreshModel: true }
  },

  campaignReportBuilder: inject.service(),

  model(queryParams) {
    return this.get('campaignReportBuilder').build(this.modelFor('campaign'), queryParams);
  }
});
