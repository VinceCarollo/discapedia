import AutoSubmit from '@stimulus-components/auto-submit'

// Connects to data-controller="auto-submit"
export default class extends AutoSubmit {
  submit() {
    if (this.element.elements[0].value.length > 1) {
      super.submit()
    }
  }
}
