import Ember from 'ember';
import Leaflet from 'bd-pro/utils/leaflet';
let { run } = Ember;

const TILE_URL = '//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

export default Ember.Component.extend({
  map: null,
  markerLayer: null,
  shapeLayer: null,
  shapes: [],
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
    this.drawShapes();
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
    let zipCodes = this.get('shapes').toArray();
    this.get('shapeLayer').clearLayers();

    let shapes = zipCodes.map((zipCode) => {
      let coordinates = zipCode.get('shape.coordinates');
      let style = { color: "#82878A", fillColor: "#BCC3C1", fillOpacity: 0.5, opacity: 0.55, weight: 3 };
      let shapeLayer =  Leaflet.multiPolygon(coordinates, style);
      this.configurePopup(zipCode, shapeLayer);
      return shapeLayer;
    });

    this.get('shapeLayer').addLayer(Leaflet.layerGroup(shapes));
  },

  configurePopup(zipCode, shapeLayer) {
    let popupText = "Zip Code: " + zipCode.get('code') + "<br /> Vehicle Count: " + zipCode.get('count');
    let popup = Leaflet.popup({closeButton: false}).setContent(popupText);
    let map = this.get("map");

    shapeLayer.on('mouseover', function(e) {
      popup.setLatLng(e.layer.getBounds().getCenter()).openOn(map);
      e.layer.setStyle({ fillOpacity: 0.85 })
      this.openPopup();
    });

    shapeLayer.on('mouseout', function(e) {
      e.layer.setStyle({ fillOpacity: 0.55 })
      this.invoke('closePopup');
    });

    return shapeLayer;
  }
});
