<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find your lecture theatre</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
* {
	margin: 10;
	padding: 0;
}

#map {
	height: 500px;
}

#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#right-panel select, #right-panel input {
	font-size: 15px;
}

#right-panel select {
	width: 100%;
}

#right-panel i {
	font-size: 12px;
}

#right-panel {
	height: 100%;
	float: right;
	width: 390px;
	overflow: auto;
}

#new-divtop {
	margin-top: 25px;
}
</style>

</head>
<body>





	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="Index.jsp"
				class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">hi, <%=session.getAttribute("Susrname")%></a>


		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
			<!-- 			<a href="#team" class="w3-bar-item w3-button">Team</a> <a
				href="#applications" class="w3-bar-item w3-button">Applications</a> -->
			<!--     <a href="#pricing" class="w3-bar-item w3-button">Price</a> -->
			<a href="#contact" class="w3-bar-item w3-button">Contact</a>
		</div>
	</div>




	<div class="w3-container w3-margin-top">
		<div class="w3-container w3-margin-top">
		<h1>Input your destination.</h1>
		-----------------------------------------------------------
			<div id="right-panel" class="w3-container w3-margin-top"></div>

			<div id="map" class="w3-container w3-margin-top"></div>
		</div>
	</div>
	<script>
      var map, infoWindow;
	  var places, pos;

      function initMap() {
    	  var directionsDisplay = new google.maps.DirectionsRenderer();
    	  var directionsService = new google.maps.DirectionsService();
    	  var markers = [];
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 53.3817, lng: -1.48213},
          zoom: 15
        });
        infoWindow = new google.maps.InfoWindow;
        var searchBox = new google.maps.places.SearchBox(document.getElementById('mapsearch'));
        
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('right-panel'));
        
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
           pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
			//mypos = pos;
            infoWindow.setPosition(pos);
            infoWindow.setContent('Here you are.');
            var markerme = new google.maps.Marker({map:map, position:pos});
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          handleLocationError(false, infoWindow, map.getCenter());
          pos = {
        		  lat: 53.3817, lng: -1.48213
                };
        }
        

        
        searchBox.addListener('places_changed', function() {
            places = searchBox.getPlaces();
			//target = places;
            if (places.length == 0) {
              return;
            }

            // Clear out the old markers.
            markers.forEach(function(marker) {
              marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
              if (!place.geometry) {
                console.log("Returned place contains no geometry");
                return;
              }
              var icon = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(25, 25)
              };

              // Create a marker for each place.
              markers.push(new google.maps.Marker({
                map: map,
                icon: icon,
                title: place.name,
                position: place.geometry.location
              }));

              if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
              } else {
                bounds.extend(place.geometry.location);
              }
            });
            map.fitBounds(bounds);
          });
        

        document.getElementById('calroute').onclick= function(){
        	console.log("sssss"+markers[0].position);
        	console.log("sssss"+pos.lat);
        	calculateRoute();
        }
        function calculateRoute(){
        	  var mypos = new google.maps.LatLng(pos.lat,pos.lng);
        	  var request = {
         			origin: mypos,
         	  		destination: markers[0].position,
        	  		travelMode: 'WALKING'
        	  };
         	  directionsService.route(request, function(result, status){
        		  if(status == "OK"){
         			  directionsDisplay.setDirections(result);
         		  }else {
                window.alert('Directions request failed due to ' + status);
              }
         	  });
           }
      }


      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }

</script>
	<div class="w3-container w3-margin-top"">
		<b>Where are you going?</b>
	</div>
	<input type="text" id="mapsearch" size="50">
	<button id="calroute">Go</button>
	<div class="w3-container w3-margin-top">
		<button align="center" class="w3-button w3-black" id="back"
			onclick="javascrtpt:window.location.href='/MyProject/FindLTNoJS.jsp'">back</button>
	</div>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2361SNJ_ailI-Ja5mU1Mg3r3gvZGqRi4&libraries=places&callback=initMap"
		type="text/javascript"></script>

</body>
</html>