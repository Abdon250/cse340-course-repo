const toggleBtn = document.querySelector('.menu-toggle');
const menu = document.querySelector('nav ul');

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');

    // Change icon
    if (menu.classList.contains('active')) {
        toggleBtn.textContent = '✖'; // X
    } else {
        toggleBtn.textContent = '☰'; // Hamburger
    }
});