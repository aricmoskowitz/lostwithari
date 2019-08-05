var GOOGLE_MAP_KEY = "AIzaSyDxvMvZq9ne6hfGAWCeg3obw6VRQw2KfdQ";


function loadScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?' +
        'key=' + GOOGLE_MAP_KEY + '&callback=initMap';
    document.body.appendChild(script);
}
window.onload = loadScript;