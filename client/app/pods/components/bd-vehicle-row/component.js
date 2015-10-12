import Ember from 'ember';
let { computed } = Ember;

export default Ember.Component.extend({
  classNames: ['row', 'vehicle__row'],
  classNameBindings: ['vehicleId'],
  vehicleId: computed('vehicle.id', function() {
    return "qa-vehicle-" + this.get('vehicle.id');
  }),
  didUserClickedEditButton: false,
  isEditing: computed('didUserClickedEditButton', 'vehicle.isNew', 'vehicle.errors.isEmpty', function() {
    return this.get('didUserClickedEditButton') || this.get('vehicle.isNew') || !this.get('vehicle.errors.isEmpty');
  }),

  actions: {
    edit() {
      this.set('didUserClickedEditButton', true);
    },

    delete(vehicle) {
      vehicle.destroyRecord();
    },

    cancel(vehicle) {
      vehicle.rollbackAttributes();
      this.set('didUserClickedEditButton', false);
    },

    save(vehicle) {
      vehicle.save().then((vehicle) => {
        this.set('didUserClickedEditButton', false);
        this.sendAction('onSave', vehicle);
      });
    }
  }
});
