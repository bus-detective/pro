import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement() {
    //this.$().dropdown()
  },
  
  actions: {
    pizza: function() {
      debugger;
      //this.sendAction("onDelete", campaign);
    }
  }
});
