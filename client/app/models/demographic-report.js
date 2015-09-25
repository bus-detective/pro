import DS from 'ember-data';
let { attr } = DS;

export default DS.Model.extend({
  populationTotal: attr('number'),
  populationMale: attr('number'),
  populationFemale: attr('number'),
  population_18_24: attr('number'),
  population_25_44: attr('number'),
  population_45_64: attr('number'),
  population_65_Plus: attr('number'),
  incomeTotal: attr('number'),
  incomeMedian: attr('number')
});
