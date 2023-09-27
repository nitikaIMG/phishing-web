// smooth-scroll.js

document.addEventListener('DOMContentLoaded', function () {
    const menuItems = document.querySelectorAll('.menu-link');
    
    menuItems.forEach(function (menuItem) {
        menuItem.addEventListener('click', function (e) {
            e.preventDefault();
            const target = this.getAttribute('data-href');
            smoothScroll(target);
        });
    });

    function smoothScroll(target) {
        const targetElement = document.querySelector(target);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop,
                behavior: 'smooth',
            });
        }
    }
});

window.addEventListener('scroll', function() {
    const header = document.getElementById("header");
    if (window.pageYOffset > 50) {
        header.style.fontSize = "10px";
        header.classList.add("shrink-header");
    } else {
        header.style.fontSize = "100px";
        header.classList.remove("shrink-header");
    }
});
