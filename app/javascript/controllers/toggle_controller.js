import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "togglableButton"]
  connect() {
    // console.log("Hello from toggle_controller.js")
  }
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
  fire2() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.togglableButtonTarget.classList.toggle("d-none");
  }
}
