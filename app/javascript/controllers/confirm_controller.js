import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { message: String }

  connect() { console.log("confirm#connect", this.element) }

  confirm(event) {
    console.log('anything?')
    console.log(event)
    if (!window.confirm(this.messageValue)) {
      console.log(this.messageValue)
      event.preventDefault()
    }
  }
}
