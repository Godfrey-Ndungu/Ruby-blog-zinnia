// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('a[data-method="delete"]').forEach((element) => {
      element.addEventListener('click', (event) => {
        event.preventDefault();
        console.log('Delete link clicked');
        // Manually send a delete request
        fetch(element.href, {
          method: 'DELETE',
          headers: {
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          }
        })
        .then(response => {
          if (response.ok) {
            window.location.reload(); // Refresh to reflect changes
          }
        });
      });
    });
  });
  