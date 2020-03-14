const dateElement = document.querySelector('.timepicker-js');

  const triggerSuccess = () => {
if (dateElement) {
    dateElement.addEventListener("change", event => {
      const bookingSuccess = document.getElementById('booking-success');
      bookingSuccess.innerHTML = "";
      bookingSuccess.insertAdjacentHTML("beforeend", `<p class="checking-booking"><i class="fas fa-hourglass-start"> </i>Checking availability...</p>`);
      setTimeout(function(){
        bookingSuccess.innerHTML = "";
        bookingSuccess.insertAdjacentHTML("beforeend", `<p class="booking-success-text"><i class="far fa-check-circle"> </i>Congrats! This restaurant has availability at this time.</p>`);
      }, 3000);
    });
  };
};

export { triggerSuccess };

// export { triggerSuccess };
