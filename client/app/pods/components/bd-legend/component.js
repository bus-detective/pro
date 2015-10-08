import Ember from 'ember';
let { computed } = Ember;

export default Ember.Component.extend({
  tagName: "li",
  classNames: ["legend"],
  style: computed('background', function() {
    return new Ember.Handlebars.SafeString("background-color: " + this.get('background'));
  })
});
