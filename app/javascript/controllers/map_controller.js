import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 10 })
  }

  #addMarkersToMap() {
      new mapboxgl.Marker()
      .setLngLat([this.markerValue.lng, this.markerValue.lat])
      .addTo(this.map);
      }


  }
