import Ember from 'ember';
let { observer } = Ember;

export default Ember.Controller.extend({
  queryParams: ['startDate', 'endDate'],
  startDate: null,
  endDate: null,

  startDateDidChange: observer('model.startDate', function(){
    this.set('startDate', this.get('model.startDate'));
  }),

  endDateDidChange: observer('model.endDate', function(){
    this.set('endDate', this.get('model.endDate'));
  })
});
