import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide"
export default class extends Controller {
  static targets = ["content"]

  hideContent() {
    this.contentTargets.forEach((content) => {
      content.classList.add("hidden")
    });
  }

  showContent() {
    this.contentTargets.forEach((content) => {
      content.classList.remove("hidden")
    });
  }
}
