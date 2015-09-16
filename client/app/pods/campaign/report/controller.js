import Ember from 'ember';
import moment from 'moment';

export default Ember.Controller.extend({
  queryParams: ['startDate', 'endDate'],
  startDate: moment().subtract(14, 'days').format('YYYY-MM-DD'),
  endDate: moment().format('YYYY-MM-DD')
});
