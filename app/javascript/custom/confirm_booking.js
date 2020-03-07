const bookingButton = document.querySelector(".confirm-booking-button");

if (bookingButton) {
  const confirmBookingWithRestaraunt = () => {
    bookingButton.addEventListener("click", event => {
      const bookingConfirmation = document.querySelector(".modal-body-js");
      bookingConfirmation.innerHTML = "";
      bookingConfirmation.insertAdjacentHTML("beforeend", `<h5 class="checking-booking"><i class="fas fa-hourglass-start"> </i>Confirming booking with restaurant...</h5>`);
      setTimeout(function(){
        bookingConfirmation.innerHTML = "";
        bookingConfirmation.insertAdjacentHTML("beforeend", `<h5 class="pt-2 pb-2" style="text-align: center;"><i class="far fa-check-circle"> </i>Congrats! Since you are the 4th user of this booking, it has now been confirmed with the restaurant. Have <strong>fun!</strong></h5>`);
      }, 3000);
    });
  };
};


