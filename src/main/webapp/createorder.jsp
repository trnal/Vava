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
	<script type="text/javascript"
			src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

	<script type="text/javascript">
        function loadMap() {
            var latlng = new google.maps.LatLng(4.3695030, 101.1224120);
            var myOptions = {
                zoom: 4,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_container"),myOptions);

            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                title:"my hometown, Malim Nawar!"
            });

        }
	</script>

</head>


<body onload="loadMap()">

<div class="container">

	<nav class="navbar navbar-dark bg-dark">
		<ul class="navbar-nav mr-auto row">
			<li class="nav-item active">
				<a class="nav-link" href="#">HandyMan</a>
			</li>
		</ul>
	</nav>

	<div
			class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
		<h2>New Order</h2>

		<form method="POST" action="/order/store">
			<div class="form-group">
				<label>Name:</label> <input type="text" name="name" value="" placeholder="Pokazená práčka"
											class="form-control">
			</div>
			<div class="form-group">
				<label>Category:</label>
				<select name="category_id" class="form-control">
					<option value="0">Motory autá</option>
					<option value="1">Motory motorky</option>
					<option value="2">Práčky</option>
				</select>
			</div>
			<div class="form-group">
				<label>Description:</label> <textarea type="text" name="description"
													  value="" placeholder="Práčka vydávala zváštne zvuky pri zapínaní a pri žmmýkaní sa pokazila" class="form-control"></textarea>
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
				<label>Phone Number:</label> <input type="text" name="phoneNumber" value=""
													placeholder="0944112233" class="form-control">
			</div>

			<button type="submit" class="btn btn-primary">Send</button>
		</form>

		<div id="map_container"></div>

	</div>

</div>

</body>


</html>