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
	<c:forEach items="${orders}" var="order">
    	${order.coordLon}<br>
	</c:forEach>

<div class="container">
	<nav class="navbar navbar-dark bg-dark">
		<ul class="navbar-nav mr-auto row">
			<li class="nav-item active">
				<a class="nav-link" href="#">HandyMan</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">New Order</a>
			</li>
		</ul>
	</nav>

	<div class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
		<h2>All orders</h2>
		<div id="map_container"></div>

	</div>

</div>

<script type="text/javascript">
	var marker = null;

    function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map_container'), {
            zoom: 4,
            center: uluru
        });
    }

</script>

<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzFAb-50-x7wH2Nfz1s5XzJiHyfRlwT4Y&callback=initMap">
</script>


</body>


</html>