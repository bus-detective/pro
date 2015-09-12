import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  queryParams: {
    vehicleIds: {
      refreshModel: true
    }
  },

  campaignReportBuilder: inject.service(),

  model(queryParams) {
    return this.get('campaignReportBuilder').build({ vehicleIds: queryParams.vehicleIds.split(",") });
  }
});

