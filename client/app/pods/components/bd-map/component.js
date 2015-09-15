import Ember from 'ember';
import Leaflet from 'bd-pro/utils/leaflet';
let { on, computed, observer, run } = Ember;

export default Ember.Component.extend({
  map: null,
  lat: null,
  lng: null,
  zoom: null,
  points: [],
  zoomControl: false,
  classNames: ['map'],

  didInsertElement: function() {
    this._configureMap();
  },

  willRemoveElement: function() {
    var map = this.get('map');
    if (map) { map.remove(); }
  },

  _configureMap: function() {
    let el = this.get('element');
    let tileLayer = Leaflet.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', { detectRetina: true});
    this.set('map', Leaflet.map(el, { zoomControl: this.get('zoomControl') }));

    this.get('map').setView([this.get('lat'), this.get('lng')], this.get('zoom'));
    this.get('map').addLayer(tileLayer);
  },

  _filterVehicleLayers() {
    this.get('vehicleLayers').forEach((markerGroup) => {
      if (this.get('campaignReport.selectedVehicleIds').contains(markerGroup.get('vehicle.id'))) {
        this.get('map').addLayer(markerGroup.get('layer'));
      } else {
        this.get('map').removeLayer(markerGroup.get('layer'));
      }
    });
  },

  vehicleLayers: computed.map('campaignReport.vehicles', (vehicle) => {
    let markers = vehicle.get('vehiclePositions').map((position) => {
      return Leaflet.circleMarker([position.get('lat'), position.get('lng')]);
    });

    return Ember.Object.create({
      vehicle: vehicle, 
      layer: Leaflet.layerGroup(markers) 
    });
  }),

  filtersDidChange: on('init', observer('campaignReport.selectedVehicleIds', function() {
    run.once(this, '_filterVehicleLayers');
  }))
});
