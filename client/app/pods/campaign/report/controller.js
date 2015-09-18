import Ember from 'ember';
import moment from 'moment';
let { observer } = Ember;

export default Ember.Controller.extend({
  queryParams: ['startDate', 'endDate'],
  startDate: moment().subtract(2, 'weeks').format("YYYY-MM-DD"),
  endDate: moment().format("YYYY-MM-DD"),

  startDateDidChange: observer('model.startDate', function(){
    this.set('startDate', this.get('model.startDate'));
  }),

  endDateDidChange: observer('model.endDate', function(){
    this.set('endDate', this.get('model.endDate'));
  })
});


