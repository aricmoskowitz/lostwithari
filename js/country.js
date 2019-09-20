function createMarker(url, pos, t, inc) {
    var marker = new google.maps.Marker({
        position: pos,
        map: map, // google.maps.Map 
        title: t,
        //icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld='+inc+'|FE6256|000000'
        icon: 'https://chart.apis.google.com/chart?chst=d_map_spin&chld=0.7|0|FCCA46|13|b|' + inc

    });

    var zoom = map.getZoom();

    google.maps.event.addListener(marker, 'click', function() {
        map.setZoom(zoom + 2);
        map.setCenter(marker.getPosition());
    });
    google.maps.event.addListener(marker, 'dblclick', function() {
        window.open(url);
    });
    return marker;
}

// Loop through the results array and place a marker for each
// set of coordinates.
function addMarkerToMap(results) {
    for (var i = 0; i < results.length; i++) {
        var coords = results[i].geometry.coordinates;
        var latLng = new google.maps.LatLng(coords[1], coords[0]);
        var title = results[i].properties.Title;

        createMarker(results[i].properties["Google Maps URL"], latLng, title, i + 1)
    }
    //https://developers.google.com/maps/documentation/javascript/reference/marker#MarkerOptions
}


function centerMap(markerPostion) {
    map.setCenter(markerPostion);
}