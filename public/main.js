M.AutoInit();

// let elem = document.querySelector('.dropdown-trigger');
// let instance = M.Dropdown.init(elem, options);

// var elem = document.querySelector('.parallax');
// var instance = M.Parallax.init(elem, options);





let topBtn = document.querySelector('#top-btn');

topBtn.addEventListener('click', (event) => {
    document.querySelector('#headerimg').scrollIntoView({
        behavior: 'smooth'
    });
});