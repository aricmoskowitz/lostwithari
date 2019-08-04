var earth;
var homeCoords = [40.888193, -73.436393];
var currentCoords = [-33.8696, 151.20695];

function initialize() {
  earth = new WE.map('map',{
    zooming: false
  });
  earth.setView([40.888193, -73.436393], 4);
  WE.tileLayer('https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg', {
    tileSize: 256,
    bounds: [[-85, -180], [85, 180]],
    minZoom: 0,
    maxZoom: 20,
    tms: true,
  }).addTo(earth);

  var markerHome = WE.marker(homeCoords, 'http://chart.apis.google.com/chart?chst=d_map_spin&chld=0.7|0|FCCA46|13|b|H').addTo(earth)
  markerHome.bindPopup('<b>Home</b>', 100);


  var markerCurrent = WE.marker(currentCoords,'http://chart.apis.google.com/chart?chst=d_map_spin&chld=0.7|0|FCCA46|13|b|').addTo(earth)
  markerCurrent.bindPopup('<b>Sydney, AUS</b>', 100);
  markerCurrent.openPopup();


}

function toCurrent() {
  setTimeout(function() {earth.panTo(currentCoords,{heading: 90, tilt: 25, duration: 1})}, 3500);
}

function startUp() {
  initialize();
  toCurrent();
}
