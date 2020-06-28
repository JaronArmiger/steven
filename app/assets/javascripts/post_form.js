if (typeof textarea === 'undefined' || textarea === null) {
    console.log('working');
}
const textarea = document.querySelector('textarea');
console.log('running?');

textarea.addEventListener('focus', changeHeight);
textarea.addEventListener('focus', changeHeight);

function changeHeight(e) {
	e.target.style.height = 'inherit';
	let computed = window.getComputedStyle(e.target);

	var height = parseInt(computed.getPropertyValue('border-top-width'), 10)
         + parseInt(computed.getPropertyValue('padding-top'), 10)
         + e.target.scrollHeight
         + parseInt(computed.getPropertyValue('padding-bottom'), 10)
         + parseInt(computed.getPropertyValue('border-bottom-width'), 10);
	this.style.height = height + 'px';
}
let buttonShowing = false;
const xButton = document.querySelector('#x-button');

textarea.addEventListener('input', function(e) {
	if (!buttonShowing) {
		xButton.style.display = "block";
		buttonShowing = true;
	};
});
xButton.addEventListener('click', function(e) {
	textarea.value = '';
	xButton.style.display = 'none';
	buttonShowing = false;
});

const file_field = document.querySelector('#post_image');
file_field.addEventListener('change', function(e) {
	const size_in_megabytes = this.files[0].size/1024/1024;
	if (size_in_megabytes > 5) {
		alert("Max file size is 5MB. Choose a smaller file dawg");
		file_field.value = '';
	}
});