import Ember from 'ember';
let { computed } = Ember;

export default Ember.Object.extend({
  vehicles: [],
  vehiclePositions: [],
  selectedVehicles: computed.filterBy('vehicles', 'isSelected', true),

  selectedVehiclePositions: computed('selectedVehicles', function() {
    let selectedVehicleRemoteIds = this.get('selectedVehicles').mapBy('remoteId');
    return this.get('vehiclePositions').filter((vehiclePosition) => {
      return selectedVehicleRemoteIds.contains(vehiclePosition.get('vehicleRemoteId'));
    });
  }), 

  incomeMedian: computed('demographicReports', function() {
    return this.get('demographicReports').findBy('key', 'income_median');
  }),

  genderDemographics: computed.filterBy('demographicReports', 'group', 'gender'),
  ethnicityDemographics: computed.filterBy('demographicReports', 'group', 'ethnicity'),
  ageDemographics: computed.filterBy('demographicReports', 'group', 'age'),
  housingDemographics: computed.filterBy('demographicReports', 'group', 'housing'),

  zipCodes: [
    Ember.Object.create({
      code: 45208,
      count: 43,
      coordinates: [
        [ 39.334297, -84.819946 ],
        [ 39.330049, -84.303589 ],
        [ 39.040520, -84.270630 ],
        [ 39.027719, -84.852905 ],
        [ 39.334297, -84.819946 ]
      ]
    })
  ]
});
