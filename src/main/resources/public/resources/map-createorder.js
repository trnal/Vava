var marker = null;
var lat = null;
var lng = null;
var address = null;
var geocoder;

var uluru = {
	lat : 48.14816,
	lng : 17.10674
};



function initMap() {
	var map = new google.maps.Map(document
			.getElementById('map_container'), {
		zoom : 8,
		center : uluru
	});
	geocoder = new google.maps.Geocoder;

	marker = new google.maps.Marker({
		position : uluru,
		map : map,
	});
	lat = marker.getPosition().lat();
	lng = marker.getPosition().lng();

	document.getElementById('map-long').setAttribute('value', lng);
	document.getElementById('map-lat').setAttribute('value', lat);

	map.addListener('click', function(e) {
		placeMarker(e.latLng, map);
	});
	address = getAddress(marker.getPosition());
	
	
	//
	
	  // Create the search box and link it to the UI element.
	  var input = document.getElementById('pac-input');
	  var searchBox = new google.maps.places.SearchBox(input);
	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	
	  // Bias the SearchBox results towards current map's viewport.
	  map.addListener('bounds_changed', function() {
	    searchBox.setBounds(map.getBounds());
	  });
	  
	  
	  searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
	//
}

function placeMarker(position, map) {
	marker.setMap(null);
	marker = new google.maps.Marker({
		position : position,
		map : map
	});


	lat = marker.getPosition().lat();
	lng = marker.getPosition().lng();
	document.getElementById('map-long').setAttribute('value', lng);
	document.getElementById('map-lat').setAttribute('value', lat);
	address = getAddress(marker.getPosition());
}

function getAddress(latlng) {
	geocoder.geocode({
		'location' : latlng
	}, function(results, status) {
		if (status === 'OK') {
			if (results[0]) {
				var address = results[0].formatted_address.split(",");
				document.getElementById('address').setAttribute(
						'value', address[0]);
				document.getElementById('town').setAttribute('value',
						address[1]);
			} else {
				window.alert('No results found');
			}
		} else {
			window.alert('Geocoder failed due to: ' + status);
		}
	});
}
