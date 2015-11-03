import Ember from 'ember';
let { computed } = Ember;

export default Ember.Object.extend({
  vehicles: [],
  vehiclePositions: [],
  zipCodes: [],
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
  maritalStatusDemographics: computed.filterBy('demographicReports', 'group', 'marital_status')
});
