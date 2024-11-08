import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    // Add event listener to the input field for "Enter" key
    this.inputTarget.addEventListener("keydown", (event) => this.handleKeyDown(event))
  }

  handleKeyDown(event) {
    if (event.key === "Enter") {
      this.search()
    }
  }

  // Listen to changes in the input field and redirect to the search page
  search() {
    const query = this.inputTarget.value.trim()

    // If the query is not empty, navigate to the search page with the query parameter
    if (query.length > 0) {
      window.location.href = `/search?q=${encodeURIComponent(query)}`
    } else {
      // If the query is empty, redirect to the root or initial search page (optional)
      window.location.href = "/search"
    }
  }
}
