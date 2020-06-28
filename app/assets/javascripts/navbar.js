let prevScrollPos = window.pageYOffset;
const navbar = document.querySelector('nav');
console.log(navbar);
window.onscroll = function() {
	let currentScrollPos = window.pageYOffset;
	if (prevScrollPos > currentScrollPos) {
		navbar.style.top = "0";
	} else {
		navbar.style.top = '-200px';
	}
	prevScrollPos = currentScrollPos;
}