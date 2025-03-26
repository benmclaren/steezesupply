import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["nav"]

  toggle(event) {
    event.stopPropagation();
    // console.log('clicked')
    console.log(this.navTarget)
    console.log(event)
    this.navTarget.classList.toggle('open');
  }
}
