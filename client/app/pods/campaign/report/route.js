import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportBuilder: inject.service(),
  queryParams: {
    startDate: { refreshModel: true },
    endDate: { refreshModel: true }
  },

  model(queryParams) {
    this.get('campaignReportBuilder').setProperties({
      campaign: this.modelFor('campaign'),
      startDate: queryParams.startDate,
      endDate: queryParams.endDate,
    });
    return this.get('campaignReportBuilder');
  }
});
