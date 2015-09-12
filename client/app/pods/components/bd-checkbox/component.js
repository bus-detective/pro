import Ember from 'ember';
let { computed } = Ember;

export default Ember.Component.extend({
  array: [],
  value: null,

  isChecked: computed('value', 'selection', function() {
    return this.get('selection').contains(this.get('value'));
  }),
  
  click: function() {
    if (this.get('isChecked')) {
      this.sendAction('onUncheck', this.get('value'));
    } else {
      this.sendAction('onCheck', this.get('value'));
    }
  }
});
