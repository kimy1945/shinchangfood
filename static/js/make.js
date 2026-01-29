document.querySelectorAll('img:not(.no-zoom)').forEach(img => {
	  	img.style.cursor = 'zoom-in';
	 	img.addEventListener('click', () => {
		document.getElementById('fullscreenImage').src = img.src;
		document.getElementById('fullscreenModal').style.display = 'flex';
  	});
});
  
function hideFullscreen() {
	document.getElementById('fullscreenModal').style.display = 'none';
}  