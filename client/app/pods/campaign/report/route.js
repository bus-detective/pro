import Ember from 'ember';
let { inject } = Ember;

export default Ember.Route.extend({
  model(queryParams) {
    return Ember.Object.create({
      vehicles: this.modelFor('campaign').get('vehicles').map((vehicle) => { 
        return { 
          id: vehicle.get('id'), 
          remoteId: vehicle.get('remoteId'), 
          isSelected: true 
        }
      })
    })
  }
});
