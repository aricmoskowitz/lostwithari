/***********Customize Variables******************/
/*portugal*/
/*Portugal*/

var portugal = { lat: 39.399872, lng: -8.224454 };
var zoomVar = 6.5;
var this_js_script = $('script[src*=portugal]');
/************************************************/

var map;
var country_code_filter = this_js_script.attr('country_code_filter_var_01');
var country_name = 'Portugal';


function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: zoomVar,
        center: portugal,
    });

    addMarkerToMap(filteredArray);

}

var filteredArray = SAVED_PLACES.features.filter(function(feature) {
    return ((feature.properties.Location["Country Code"] == country_code_filter) || (!feature.properties.Location.hasOwnProperty("Country Code") && feature.properties.Title.includes(country_name)) || (!feature.properties.Location.hasOwnProperty("Country Code") && feature.properties["Google Maps URL"].includes(country_name)));
});




var str = ""

filteredArray.forEach(function(feature, i) {
    i = i + 1
    if (feature.properties.Location.hasOwnProperty("Country Code")) {
        str +=
            '<button type="button"' +
            ' class="bg-primary_color color-secondary_color hover-bg-secondary_color hover-color-primary_color' +
            ' poi-list-group-item border-secondary_color"' +
            ' onclick="centerMap({lat:' + feature.properties.Location["Geo Coordinates"].Latitude + ',' +
            ' lng:' + feature.properties.Location["Geo Coordinates"].Longitude + '})">' +
            i + ") " + feature.properties.Title + '</button>' + "\n";
    } else {
        str +=
            '<button type="button"' +
            ' class="bg-primary_color color-secondary_color hover-bg-secondary_color hover-color-primary_color' +
            ' poi-list-group-item border-secondary_color"' +
            ' onclick="centerMap({lat:' + feature.properties.Location.Latitude + ',' +
            ' lng:' + feature.properties.Location.Longitude + '})">' +
            i + ") " + feature.properties.Title + '</button>' + "\n";
    }

});

document.getElementById("poiList").innerHTML = str;