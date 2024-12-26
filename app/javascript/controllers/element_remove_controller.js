import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("connect element remove stimulus controller js!")
  }

  remove() {
    this.element.remove();
  }
}
