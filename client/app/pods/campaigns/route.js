import Ember from 'ember';
import AuthenticatedRouteMixin from 'bd-pro/mixins/authenticated-route'

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.get('store').findAll('campaign');
  }
});
