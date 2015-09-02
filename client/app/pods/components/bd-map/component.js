import Ember from 'ember';

export default Ember.Component.extend({
  map: null,
  lat: null,
  lng: null,
  zoom: null,
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

    L.marker(center).addTo(map);

    L.polygon(
      [
        [39.1, -84.5],
        [39.1, -84.55],
        [39.12, -84.55]
      ], {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5
      }
    ).addTo(map);
  }
});
