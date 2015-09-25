import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'fieldset',
  model: null,
  classNames: ['form-group'],
  classNameBindings: ['hasError'],
  property: null,
  hasError: Ember.computed.notEmpty('model.errors'),
  defineObjectWithErrors: function() {
    Ember.defineProperty(this, 'objectWithErrors', Ember.computed.alias('model.errors.' + this.get('property')));
  }.on('init', 'objectWithErrors')
});
