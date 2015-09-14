import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  queryParams: {
    vehicleIds: {
      refreshModel: false 
    }
  },

  model(queryParams) {
    return this.modelFor('campaign.report');
  }
});

