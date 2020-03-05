//= require moment
//= require tempusdominus-bootstrap-4.js

import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { openModal, closeModal } from '../custom/modal.js';
import { initStarRating } from 'plugins/init_star_rating';
import { triggerSuccess } from 'custom/booking_available.js';

triggerSuccess();
initStarRating();

