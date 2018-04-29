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
			<div class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
				<h2>All orders</h2>
				<div id="map_container"></div>
			</div>
	</div>

	<script type="text/javascript">
		function initMap() {
			var markers = ${orders}
			var createdmarkers = [];
			var uluru = {
				lat : -25.363,
				lng : 131.044
			};
			var map = new google.maps.Map(document
					.getElementById('map_container'), {
				zoom : 4,
				center : uluru
			});
			for (var i = 0; i < markers.length; i++) {
				var obj = markers[i];
				var marker = new google.maps.Marker({
					position : {
						lat : obj["coordLat"],
						lng : obj["coordLon"]
					},
					map : map,
				});
				createdmarkers.push(marker);
			}
			createdmarkers.forEach(function(marker, i){
				marker.addListener('click', function(){
					map.setZoom(6);
					map.setCenter(marker.getPosition());
					window.location.href = "/order-detail/"+markers[i]["id"];
				});
			});

		}
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzFAb-50-x7wH2Nfz1s5XzJiHyfRlwT4Y&callback=initMap">
		
	</script>


</body>


</html>