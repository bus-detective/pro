import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'fieldset',
  model: null,
  classNames: ['form-group'],
  classNameBindings: ['hasError'],
  hasError: Ember.computed.notEmpty('errors'),
  errors: []
});
