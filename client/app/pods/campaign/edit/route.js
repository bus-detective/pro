import Ember from 'ember';

export default Ember.Route.extend({
  setupController: function(controller, model) {
    this._super(controller, model);
    let vehicle = this.get('store').createRecord('vehicle', { campaign: model });
    controller.set('newVehicle', vehicle);
  },

  resetController(controller, isExiting) {
    if(isExiting) {
      controller.get('newVehicle').destroyRecord().then(() => {
        this.transitionTo('campaigns');
      });
    }
  }
});
