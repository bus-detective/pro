import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportFilters: inject.service(),

  beforeModel() {
    this.get('campaignReportFilters').setProperties({
      campaign: this.modelFor('campaign')
    })
  },

  model() {
    return this.get('campaignReportFilters');
  },
  
  actions: {
    applyFilters(campaignReportFilters) {
      this.currentModel.fetchData();
    }
  }
});
