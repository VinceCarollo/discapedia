import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disc-search"
export default class extends Controller {
  static targets = [ "input", "results" ]

  hideResultsOnClear() {
    if (this.inputTarget.value.length < 1) {
      this.resultsTarget.classList.add('hidden')
    }
  }

  showResultsIfPresent() {
    if (this.inputTarget.value.length > 0) {
      this.resultsTarget.classList.remove('hidden')
    }
  }

  blurInput(e) {
    this.inputTarget.blur()
  }
}
