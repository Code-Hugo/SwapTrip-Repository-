// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "flatpickr/dist/flatpickr";
import "channels"
//import "../channels/validate"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import { initFlatpickr } from "../plugins/flatpickr";

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { validateFlightTicket } from "../pages/flight_ticket_index"
import { editPriceFlightTicket } from "../pages/flight_ticket_edit";
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  // Call your functions here, e.g:
  // initSelect2();
  validateFlightTicket();
  editPriceFlightTicket();
});
