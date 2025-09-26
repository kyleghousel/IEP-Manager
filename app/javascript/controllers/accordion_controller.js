import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel","icon"]

  toggle() {
    const hidden = this.panelTarget.toggleAttribute("hidden")
    const expanded = !hidden
    this.iconTarget.style.transform = expanded ? "rotate(180deg)" : ""
  }
}
