import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["message"]
  
  connect() {
    this.autoDismiss()
  }

  autoDismiss() {
    setTimeout(() => {
      this.messageTarget.classList.add("opacity-0")
      setTimeout(() => {
        this.messageTarget.remove()
      }, 300)  // Wait for the fade-out animation to finish
    }, 5000)  // Dismiss after 5 seconds
  }
}
