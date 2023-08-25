import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['container'];

  connect() {
    this.toggleClass = 'hidden';
  }

  disconnect() {
    this.closeModal(null);
  }

  openModal() {
    document.body.classList.add('overflow-hidden');
    this.containerTarget.classList.remove(this.toggleClass);
  }

  closeModal(event) {
    if (event) {
      event.preventDefault();
    }
    document.body.classList.remove('overflow-hidden');
    const modal = document.getElementById('custom-comment-modal');
    modal.classList.add('hidden');
  }

  toggleCommentModal() {
    const container = event.currentTarget.closest('[data-controller="comment-modal"]');
    const modalContainer = container.querySelector('[data-modal-target="container"]');
    if (modalContainer) {
      modalContainer.classList.toggle(this.toggleClass);
    }
  }

}

