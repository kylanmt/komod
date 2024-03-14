import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      inline: true,
      mode: "range",
      minDate: "today",
      disable: window.disable_dates,
    })
  }
}
