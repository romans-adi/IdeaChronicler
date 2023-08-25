import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { postId: Number }

  like() {
    Turbo.visit(`/posts/${this.postIdValue}/like`)
  }
}
