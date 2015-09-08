import DS from 'ember-data';

export default DS.Model.extend({
  campaign: DS.belongsTo('campaign')
});
