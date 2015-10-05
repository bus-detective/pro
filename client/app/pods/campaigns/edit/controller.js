import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save(model) {
      model.save().then(() => {
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
    }
  }
});
