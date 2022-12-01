import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="basket-subscription"
export default class extends Controller {
  static values = { basketId : Number }
  static targets = ["basket-items"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "BasketChannel", id: this.basketIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribe to the basket with the id ${this.basketIdValue}.`)
    }
  }
