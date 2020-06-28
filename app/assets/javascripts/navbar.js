let prevScrollPos = window.pageYOffset;
const navbar = document.querySelector('nav');
window.onscroll = function() {
	let currentScrollPos = window.pageYOffset;
	console.log(currentScrollPos);
	if (prevScrollPos > currentScrollPos || currentScrollPos < 20) {
		navbar.style.top = "0";
	} else {
		navbar.style.top = '-200px';
	}
	prevScrollPos = currentScrollPos;
}