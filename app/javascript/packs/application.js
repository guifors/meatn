
import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

import { TriggerAttendeeMondal } from '../custom/attendee_modal.js';
// TriggerAttendeeMondal();

import { openModal, closeModal } from '../custom/modal.js';
import { initStarRating } from '../plugins/init_star_rating';

// import { triggerSuccess } from '../custom/booking_available.js';
// triggerSuccess();

import { confirmBookingWithRestaurant } from '../custom/confirm_booking.js';
import "../plugins/flatpickr.js";
import { triggerSuccess } from '../custom/booking_available.js';


initMapbox();
initStarRating();
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

// triggerSuccess();
confirmBookingWithRestaurant();

