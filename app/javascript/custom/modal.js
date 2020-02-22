const modal = document.querySelector('#myModal');

const btn = document.querySelector('#myBtn');

const span = document.querySelector('#close');

const openModal = () => {
  btn.addEventListener('click', (event) => {
    modal.style.display = "block";
  });
};

const closeModal = () => {
  span.addEventListener('click', (event) => {
    modal.style.display = "none";
  });
  window.addEventListener('click', (event) => {
    if (event.target == modal) {
    modal.style.display = "none";
    }
  });
};

export { openModal, closeModal };
