import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like-button"
export default class extends Controller {
  static targets = [ "button", "buttonDestroy" ]
  static values = {
    clotheId: Number
  }
  connect() {
  }

  like(event) {
    event.preventDefault()
    const url = this.buttonTarget.parentElement.action

    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.buttonTarget.parentElement)
    })
      .then(response => response.text())
      .then((data) => {
      this.buttonDestroyTarget.classList.remove('d-none')
      this.buttonTarget.classList.add('d-none')

    })

  }

  destroy(event) {
    event.preventDefault()
    const url = `likes/unlike?clothe_id=${this.clotheIdValue}`

    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.buttonDestroyTarget.parentElement)
    })
      .then(response => response.text())
      .then((data) => {
      this.buttonDestroyTarget.classList.add('d-none')
      this.buttonTarget.classList.remove('d-none')
      })
  }
}
