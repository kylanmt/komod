import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    const firstMarker = this.markersValue[0];
    const lastMarker = this.markersValue[1];

    new mapboxgl.Marker({ color: '#E67E22', className: 'my-marker' })
      .setLngLat([firstMarker.lng, firstMarker.lat])
      .addTo(this.map);

    new mapboxgl.Marker({ color: 'red', className: 'his-marker' })
      .setLngLat([lastMarker.lng, lastMarker.lat])
      .addTo(this.map);
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 40, maxZoom: 20, duration: 0 })
  }
}
