import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="overlay"
export default class extends Controller {
  static targets = [ "overlay" ]

  connect() {
    console.log(this.element)
  }

  display(event) {
    event.preventDefault()
    console.log(this.element)
    this.overlayTarget.classList.toggle("d-none")
    this.overlayTarget.classList.add("toggle");
  }

  hide(event) {
    event.preventDefault()
    this.overlayTarget.classList.remove("active");
    this.overlayTarget.classList.add("d-none")
  }
}
