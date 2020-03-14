const bookingButton = document.querySelector(".join-booking-button");


const confirmBookingWithRestaurant = () => {
  bookingButton.addEventListener("click", event => {
    const bookingConfirmation = document.querySelector(".modal-body-js");
    // const modalButton = document.querySelector(".new-group");
    bookingConfirmation.innerHTML = "";
    // modalButton.style.display = "none";
    bookingConfirmation.insertAdjacentHTML("beforeend", `<h5 class="pt-3 pb-3"><i class="fas fa-hourglass-start pr-2"></i><strong>   Please hold...</strong></h5><p>We are now confirming the booking with the restaurant.</p>`);
    setTimeout(function(){
      bookingConfirmation.innerHTML = "";
      bookingConfirmation.insertAdjacentHTML("beforeend", `<h5 class="pt-3 pb-3"><i class="far fa-check-circle pr-2"></i><strong>   Congratulations!</strong></h5><p>Since you are the 4th user of this booking, it has now been confirmed with the restaurant.</h5><h5 class="pt-3">Have <strong>fun!</strong></h5>`);
      modalButton.style.display = "";
    }, 10000);
  });
};


export { confirmBookingWithRestaurant };
