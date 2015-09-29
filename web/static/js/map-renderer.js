export var MapRenderer = {
  osmUrl: 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
  osmAttrib: 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors',

  setupMap() {
    if (!this.mapDiv()) { return; };
    let map = this.lMap()
    map.addLayer(this.osm());
    let marker = this.marker().addTo(map);
    this.setMarkerMessage(marker);
  },

  setMarkerMessage(marker) {
    marker.bindPopup(`<b>${this.markerMessage()}</b>`).openPopup();
  },

  marker() {
    return L.marker(this.latLongArray());
  },

  markerMessage() {
    return this.mapDiv().dataset.markerMessage;
  },

  mapDiv() {
    return document.getElementById('map');
  },

  lMap() {
    return L.map('map').setView(this.latLongArray(), 13);
  },

  latLongArray() {
    return [this.latitude(), this.longitude()];
  },

  osm() {
    return new L.TileLayer(this.osmUrl, {minZoom: 8, maxZoom: 20, attribution: this.osmAttrib});
  },

  latitude() {
    return this.mapDiv().dataset.latitude;
  },

  longitude() {
    return this.mapDiv().dataset.longitude;
  }

}
