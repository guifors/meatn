//= require moment
//= require tempusdominus-bootstrap-4.js

import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { TriggerAttendeeMondal } from 'custom/attendee_modal.js';
TriggerAttendeeMondal();

import { openModal, closeModal } from '../custom/modal.js';
import { initStarRating } from 'plugins/init_star_rating';
import { triggerSuccess } from 'custom/booking_available.js';
import 'custom/confirm_booking.js';
import 'plugins/date_picker.js';


triggerSuccess();
initStarRating();
confirmBookingWithRestaraunt();

import "../plugins/flatpickr"
