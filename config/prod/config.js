var GOOGLE_MAP_KEY = "AIzaSyB4xoP9KTp9zDZKGjT_DOMQ7HoJ1jZn1gU";


function loadScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?' +
        'key=' + GOOGLE_MAP_KEY + '&callback=initMap';
    document.body.appendChild(script);
}
window.onload = loadScript;