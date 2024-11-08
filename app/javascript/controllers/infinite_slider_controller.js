import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infinite-slider"
export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.startAnimation()
  }

  startAnimation() {
    this.containerTarget.classList.add("animate-slide")
    // Clone the contents to create a seamless effect
    this.cloneContents()
  }

  cloneContents() {
    const container = this.containerTarget
    const clone = container.cloneNode(true)
    clone.classList.remove("animate-slide") // Remove animation to prevent double animation
    container.appendChild(clone)
  }
}
