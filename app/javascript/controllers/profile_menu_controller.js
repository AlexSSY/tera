import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-menu"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    document.addEventListener("click", (event) => {
      if (!this.element.contains(event.target)) {
        this.close();
      }
    });
  }

  toggle() {
    this.menuTarget.classList.toggle("hidden");
  }

  close() {
    this.menuTarget.classList.add("hidden");
  }
}
