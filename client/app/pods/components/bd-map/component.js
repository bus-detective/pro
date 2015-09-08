import Ember from 'ember';

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
    var map = L.map(el, { zoomControl: this.get('zoomControl') });
    var center = [this.get('lat'), this.get('lng')];
    var zoom = this.get('zoom');

    this.set('map', map);

    map.setView([this.get('lat'), this.get('lng')], this.get('zoom'));

    L.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
      detectRetina: true
    }).addTo(map);

    this.get('points').map((point) => { 
      L.circleMarker([point.get('lat'), point.get('lng')]).addTo(map);
    });
  }
});
