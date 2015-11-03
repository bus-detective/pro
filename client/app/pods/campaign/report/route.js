import Ember from 'ember';
import moment from 'moment';
let { inject } = Ember;

export default Ember.Route.extend({
  campaignReportBuilder: inject.service(),
  queryParams: {
    startDate: { refreshModel: true },
    endDate: { refreshModel: true }
  },

  previousStartDate: moment().subtract(2, 'weeks').format("YYYY-MM-DD"),
  previousEndDate: moment().format("YYYY-MM-DD"),

  beforeModel(queryParams) {
    let queryStartDate = queryParams.queryParams.startDate;
    let queryEndDate = queryParams.queryParams.endDate;
    let prevStartDate = this.get('previousStartDate');
    let prevEndDate = this.get('previousEndDate');

    if(queryStartDate !== prevStartDate && !Ember.isEmpty(queryStartDate)) {
      this.set('previousStartDate', queryStartDate);
    }

    if(queryEndDate !== prevEndDate && !Ember.isEmpty(queryEndDate)) {
      this.set('previousEndDate', queryEndDate);
    }
  },

  model() {
    this.get('campaignReportBuilder').setProperties({
      campaign: this.modelFor('campaign'),
      startDate: this.get('previousStartDate'),
      endDate: this.get('previousEndDate'),
    });
    return this.get('campaignReportBuilder');
  }
});
