<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
<title>Handyman</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<style>
textarea {
	resize: none;
}

div#map_container {
	width: 100%;
	height: 350px;
}
</style>

</head>


<body>

	<div class="container">

		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<a class="navbar-brand" href="/order/index">HandyMan</a>

			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/order">New
						Order</a></li>
				<li class="nav-item">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
        				<form id="logoutForm" method="POST" action="${contextPath}/logout">
            				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        					<a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a>
						</form>
					</c:if>
				</li>
			</ul>
		</nav>

		<div
			class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
			<h2>New Order</h2>

			<form method="POST" action="/order/store">
				<div class="form-group">
					<label>Name:</label> <input type="text" name="name" value=""
						placeholder="Pokazená práčka" class="form-control">
				</div>

				<div class="form-group">
					<label>Category:</label> <select name="categoryId"
						class="form-control">
						<option value="0">Motory autá</option>
						<option value="1">Motory motorky</option>
						<option value="2">Práčky</option>
					</select>
				</div>

				<div class="form-group">
					<label>Description:</label>
					<textarea name="description"
						placeholder="Práčka vydávala zvláštne zvuky pri zapínaní­ a pri žmýkaní­ sa pokazila, neviem ani vybrať prádlo."
						class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label>Address:</label> <input type="text" name="address" value=""
						placeholder="Pekná cesta3" class="form-control">
				</div>
				<div class="form-group">
					<label>Town:</label> <input type="text" name="town" value=""
						placeholder="Bratislava" class="form-control">
				</div>
				<div class="form-group">
					<label>Phone Number:</label> <input type="text" name="phoneNumber"
						value="" placeholder="0944112233" class="form-control">
				</div>

				<button type="submit" class="btn btn-primary">Send</button>

				<input hidden="true" id="map-long" name="coordLon" value="-25.363">
				<input hidden="true" id="map-lat" name="coordLat" value="131.044">

			</form>

			<div id="map_container"></div>

		</div>

	</div>

	<script type="text/javascript">
		var marker = null;
		var lat = null;
		var lng = null;

		var uluru = {
			lat : -25.363,
			lng : 131.044
		};

		var geocoder;

		function initMap() {
			var map = new google.maps.Map(document
					.getElementById('map_container'), {
				zoom : 4,
				center : uluru
			});
			geocoder = new google.maps.Geocoder();

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
		}
		
		function placeMarker(position, map) {
			marker.setMap(null);
			marker = new google.maps.Marker({
				position : position,
				map : map
			});

			map.panTo(position);
			lat = marker.getPosition().lat();
			lng = marker.getPosition().lng();
			document.getElementById('map-long').setAttribute('value', lng);
			document.getElementById('map-lat').setAttribute('value', lat);
			var address = getAddress(lat, lng);
		}

		function getAddress(lat, lng) {
			var position = new google.maps.LatLng(lat,lng);
			geocoder.geocode({
				latLng : position
			}, function(responses) {
				if (responses && responses.length > 0) {
					console.log(responses[0].fomatted_address);
				}
			});
		}
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzFAb-50-x7wH2Nfz1s5XzJiHyfRlwT4Y&callback=initMap">
		
	</script>


</body>


</html>