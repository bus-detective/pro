import Leaflet from 'bd-pro/utils/leaflet';

export function initialize() {
  Leaflet.Icon.Default.imagePath = `/assets/images`;
}

export default {
  name: 'leaflet',
  initialize: initialize
};
