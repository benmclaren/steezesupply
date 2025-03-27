import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["nav", "body"]

  connect() {
    console.log('connected');
  }

  toggle(event) {
    event.stopPropagation();
    // console.log('clicked')
    console.log(this.navTarget)
    console.log(event)
    this.navTarget.classList.add('open');
    this.bodyTarget.classList.add('shadow')
  }

  close(event) {
    this.navTarget.classList.remove('open')
    this.bodyTarget.classList.remove('shadow')
  }

}
