import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"];

  toggleDropdown() {
    this.contentTarget.classList.toggle("hidden");
  }

  close(event) {
    if (!this.element.contains(event.target)) {
      this.contentTarget.classList.add("hidden");
    }
  }
}
