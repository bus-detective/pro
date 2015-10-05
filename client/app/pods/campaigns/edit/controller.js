import Ember from 'ember';
let { observes } = Ember;

export default Ember.Controller.extend({
  actions: {
    save(model) {
      model.save().then((success) => {
        this.transitionToRoute('campaigns');
      });
    },

    delete(model) {
      model.destroyRecord().then((success) => {
        this.transitionToRoute('campaigns');
      });
    },

    cancel() {
      this.get('model').rollbackAttributes();
      this.transitionToRoute('campaigns');
    }
  }
});
