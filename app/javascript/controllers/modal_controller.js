import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['container'];

  connect() {
    this.toggleClass = 'hidden';
  }

  disconnect() {
    this.close();
  }

  open() {
    document.body.classList.add('overflow-hidden');
    this.containerTarget.classList.remove(this.toggleClass);
  }

  close() {
    if (typeof event !== 'undefined') {
      event.preventDefault();
    }
    this.containerTarget.classList.add(this.toggleClass);
    document.body.classList.remove('overflow-hidden');
  }

  toggleModal() {
    this.containerTarget.classList.toggle(this.toggleClass);
  }

}
