import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportBuilder: inject.service(),

  beforeModel() {
    this.get('campaignReportBuilder').setProperties({
      campaign: this.modelFor('campaign')
    });
  },

  model() {
    return this.get('campaignReportBuilder');
  },
  
  actions: {
    applyFilters() {
      this.currentModel.fetchReport();
    }
  }
});
