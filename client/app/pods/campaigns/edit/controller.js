import Ember from 'ember';
let { run } = Ember;

export default Ember.Controller.extend({
  actions: {
    save(model) {
      model.save().then((model) => {
        this.transitionToRoute('campaigns');
      });
    },

    delete(model) {
      model.destroyRecord().then(() => {
        this.transitionToRoute('campaigns');
      });
    },

    cancel() {
      this.get('model').rollbackAttributes();
      this.transitionToRoute('campaigns');
    },

    handleVehicleSaveSuccess(vehicle) {
      if (vehicle === this.get('newVehicle')) {
        let vehicle = this.get('store').createRecord('vehicle', { campaign: this.get('model') });
        this.set('newVehicle', vehicle);
      }
    }
  }
});
