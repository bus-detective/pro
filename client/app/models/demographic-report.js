import DS from 'ember-data';
import Ember from 'ember';
let { attr } = DS;
let { computed } = Ember;

export default DS.Model.extend({
  populationTotal: attr('number'),
  populationMale: attr('number'),
  populationFemale: attr('number'),
  population_18_24: attr('number'),
  population_25_44: attr('number'),
  population_45_64: attr('number'),
  population_65_Plus: attr('number'),
  incomeTotal: attr('number'),
  incomeMedian: attr('number'),

  populationAges: computed('population_18_24', function() {
    return [
      { label: "18 to 24", value: this.get('population_18_24') },
      { label: "25 to 44", value: this.get('population_25_44') },
      { label: "45 to 64", value: this.get('population_45_64') },
      { label: "65 plus", value: this.get('population_65_Plus') },
    ];
  }),

  populationSex: computed('population_18_24', function() {
    return [
      { label: "Male", value: this.get('populationMale') },
      { label: "Female", value: this.get('populationFemale') },
    ];
  })
});
