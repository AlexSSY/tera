import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="news-ticker"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.startScrolling()
  }

  startScrolling() {
    const content = this.contentTarget
    content.style.animation = "marquee 30s linear infinite"
  }
}
