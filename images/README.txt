This project loads all cake photography directly from Unsplash's CDN
(see the image URLs in js/script.js and the HTML pages) so the ZIP
stays lightweight. To use your own local images instead:

1. Drop your .jpg/.png files in this /images folder.
2. Update the "img" fields in js/script.js (CAKES array) and the
   <img src="..."> tags in index.html / pages/*.html to point here,
   e.g. src="images/chocolate-cake.jpg" (or "../images/..." from /pages).
