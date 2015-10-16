import Ember from 'ember';
import Leaflet from 'bd-pro/utils/leaflet';
let { run } = Ember;

const TILE_URL = '//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

export default Ember.Component.extend({
  map: null,
  markerLayer: null,
  shapeLayer: null,
  lat: null,
  lng: null,
  zoom: null,
  vehicleLayers: [],
  classNames: ['map'],
  markerOptions: {
    fillColor: '#42B4E3',
    fillOpacity: 0.9,
    stroke: false,
  },

  didInsertElement() {
    this.configureMap();
    this.drawMarkers();
    this.drawShapes();
  },

  willDestroyElement() {
    var map = this.get('map');
    if (map) { map.remove(); }
  },

  didUpdateAttrs() {
    run.once(this, 'drawMarkers');
  },

  configureMap() {
    this.set('map', Leaflet.map(this.get('element'), { scrollWheelZoom: false }));
    this.get('map').setView([this.get('lat'), this.get('lng')], this.get('zoom'));
    this.get('map').addLayer(Leaflet.tileLayer(TILE_URL, { detectRetina: true}));
    this.set('markerLayer', Leaflet.layerGroup().addTo(this.get('map')));
    this.set('shapeLayer', Leaflet.layerGroup().addTo(this.get('map')));
  },

  drawMarkers() {
    this.get('markerLayer').clearLayers();
    let markers = this.get('vehiclePositions').map((vehiclePosition) => {
      return Leaflet.circleMarker([vehiclePosition.get('lat'), vehiclePosition.get('lng')], this.get('markerOptions')).setRadius(5);
    });
    this.get('markerLayer').addLayer(Leaflet.layerGroup(markers));
  },

  drawShapes() {
    this.get('shapeLayer').clearLayers();
    let shapes = this.get('shapes').map((shape) => {
      return Leaflet.polygon(shape.get('coordinates'));
    });
    this.get('shapeLayer').addLayer(Leaflet.layerGroup(shapes));
  }
});
