<%@ include file="/partials/prefix.jsp" %>

<!DOCTYPE html>

<html>
<head>
	<jsp:include page="/partials/head.jsp"></jsp:include>
</head>


<body>
	<div class="container">
		<jsp:include page="/partials/navigation.jsp"></jsp:include>

			<div class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
				<h2><spring:message code="order.all"/></h2>
				<div id="map_container" class="map_full"></div>
			</div>
	</div>

	<script type="text/javascript">
		function initMap() {
			var iw = new google.maps.InfoWindow();
			var markers = ${orders}
			var createdmarkers = [];
			var uluru = {
				lat : 48.14816,
				lng : 17.10674
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
				
				marker.addListener('mouseover', function(){
					$.ajax({  
		                url: '/order/data?orderid='+markers[i]["id"],  
		                success: function(data) { 
		                	iw.setContent(data);  
		                    iw.open(map, marker);
		                }  
		            });
				});
			});

		}
	</script>

	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzFAb-50-x7wH2Nfz1s5XzJiHyfRlwT4Y&callback=initMap"></script>

</body>


</html>