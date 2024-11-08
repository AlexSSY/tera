import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="faq"
export default class extends Controller {
  static targets = ["content"];

  toggle(event) {
    const content = event.target.nextElementSibling;
    const isVisible = content.classList.contains('hidden');

    // Hide all other open accordion items
    this.contentTargets.forEach(item => item.classList.add('hidden'));

    // Toggle the clicked accordion content
    if (isVisible) {
      content.classList.remove('hidden');
    } else {
      content.classList.add('hidden');
    }
  }
}
