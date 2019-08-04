var map;
var this_js_script = $('script[src*=country]');

var country_code_filter = this_js_script.attr('country_code_filter_var_01');   

function initMap() {
    var japan = {lat: 36.220096, lng: 138.257982};
    var zoomVar = 6;
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: zoomVar,
    center: japan,
  }); 

  addMarkerToMap(filteredArray);

}

var filteredArray = SAVED_PLACES.features.filter(function (el) {
  return el.properties.Location["Country Code"] == country_code_filter;
});

function createMarker(url, pos, t, inc) {
  var marker = new google.maps.Marker({       
      position: pos, 
      map: map,  // google.maps.Map 
      title: t,  
      //icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld='+inc+'|FE6256|000000'
      icon: 'http://chart.apis.google.com/chart?chst=d_map_spin&chld=0.7|0|FFFF42|13|b|'+inc
    
  }); 

  var zoom = map.getZoom();

  google.maps.event.addListener(marker, 'click', function() { 
    map.setZoom(zoom+2);
    map.setCenter(marker.getPosition());
  }); 
  google.maps.event.addListener(marker, 'dblclick', function() { 
    window.open(url);
  }); 
  return marker;  
}

// Loop through the results array and place a marker for each
// set of coordinates.
function addMarkerToMap (results) {
  for (var i = 0; i < results.length; i++) {
    var coords = results[i].geometry.coordinates;
    var latLng = new google.maps.LatLng(coords[1],coords[0]);
    var title = results[i].properties.Title;

    createMarker(results[i].properties["Google Maps URL"],latLng,title,i)
  }
  //https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerOptions
}




var str = ""
function centerMap (markerPostion){
  map.setCenter(markerPostion);
}

filteredArray.forEach(function(feature, i) {
  str += 
  '<button type="button"'
  +' class="bg-primary_color color-secondary_color hover-bg-secondary_color hover-color-primary_color'
  +' poi-list-group-item border-secondary_color"'
  +' onclick="centerMap({lat:'+ feature.properties.Location["Geo Coordinates"].Latitude +','
  +' lng:'+ feature.properties.Location["Geo Coordinates"].Longitude +'})">'
  + i + ") " + feature.properties.Title + '</button>' + "\n";
}); 

document.getElementById("poiList").innerHTML = str;





