import Ember from 'ember';
import Leaflet from 'bd-pro/utils/leaflet';
let { run } = Ember;

export default Ember.Component.extend({
  map: null,
  markerLayer: null,
  lat: null,
  lng: null,
  zoom: null,
  vehicleLayers: [],
  classNames: ['map'],

  didInsertElement() {
    this.configureMap();
    this.drawMarkers();
  },

  willDestroyElement() {
    var map = this.get('map');
    if (map) { map.remove(); }
  },

  didUpdateAttrs() {
    run.once(this, 'drawMarkers');
  },

  configureMap() {
    this.set('map', Leaflet.map(this.get('element')));
    this.get('map').setView([this.get('lat'), this.get('lng')], this.get('zoom'));
    this.get('map').addLayer(Leaflet.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', { detectRetina: true}));
    this.set('markerLayer', Leaflet.layerGroup().addTo(this.get('map')));
  },

  drawMarkers() {
    this.get('markerLayer').clearLayers();
    let markers = this.get('vehiclePositions').map((vehiclePosition) => {
      return Leaflet.circleMarker([vehiclePosition.get('lat'), vehiclePosition.get('lng')]);
    });
    this.get('markerLayer').addLayer(Leaflet.layerGroup(markers));
  }
});
