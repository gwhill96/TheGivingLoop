import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="basket-subscription"
export default class extends Controller {
//   static values = { basketId: Number }

  static get values() {
    return { basketId: Number }
  }

  static get targets() {
    return ["basket"]
  }
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "BasketChannel", id: this.basketIdValue },
      { received: data => this.basketTarget.innerHTML = data }
    )
    // console.log(`Subscribe to the basket with the id ${this.basketIdValue}.`)
  }
}
