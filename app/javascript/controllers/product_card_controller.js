import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static values = {
    id: Number
  }

  update(event) {
    // prevent the default behavior of the link_to
    event.preventDefault();
    // create a body to send in the request (with the offset)
    const formData = new FormData;
    formData.append('offset', event.currentTarget.dataset.offset);
    // send the request
    fetch(`/product_carts/${this.idValue}`, {
      method: 'PATCH',
      headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() },
      body: formData
    })
      // transform response to text
      .then(res => res.text())
      // call it and update the HTML with the response
      .then((data) => {
        this.element.outerHTML = data;
        // this response comes from the product_carts_controller on the update action
      })
  }

  destroy(event) {
    // prevent the default behavior of the link_to
    event.preventDefault();
    // send the request to delete
    fetch(`/product_carts/${this.idValue}`, {
      method: 'DELETE',
      headers: { 'Accept': 'text/plain', 'X-CSRF-Token': csrfToken() }
    })
      .then((response) => {
        console.log(response);
        // then, remove the element from the DOM
        this.element.remove();
      })
  }
}
