import Ember from 'ember';
import Leaflet from 'bd-pro/utils/leaflet';

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
    var el = this.get('element');
    var map = Leaflet.map(el, { zoomControl: this.get('zoomControl') });

    this.set('map', map);
    this.set('markerLayer', new Leaflet.FeatureGroup());

    map.setView([this.get('lat'), this.get('lng')], this.get('zoom'));

    Leaflet.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
      detectRetina: true
    }).addTo(map);
  },

  pointsDidChange: Ember.observer('points.length', function() {
    this.get('map').removeLayer(this.get('markerLayer'));
    this.set('markerLayer', new Leaflet.FeatureGroup());

    this.get('points').map((point) => {
      Leaflet.circleMarker([point.get('lat'), point.get('lng')]).addTo(this.get('markerLayer'));
    });

    this.get('markerLayer').addTo(this.get('map'));
  })
});
