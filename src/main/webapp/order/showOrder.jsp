<%@ include file="/partials/prefix.jsp"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
</head>

<body>

	<div class="container">

		<!-- top navigation -->
		<jsp:include page="/partials/navigation.jsp"></jsp:include>
		<!-- Detail -->
		<div class="col-xs-12 col-sm-10 offset-sm-1">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-3">
					<h2>${order.getName()}</h2>
					<div>${order.getDescription()}</div>
					<div>${order.getPhoneNumber()}</div>
					<div>${order.getTown()}</div>
					<div>${order.getAddress()}</div>
					<form:form id="delete-form" method="POST" action="/order/delete">
						<input hidden name="orderId" value="${order.getId()}"></input>
						<c:if test="${authenticatedUser == true}">
							<button class="btn btn-danger mt-4" type="submit">
								<spring:message code="order.delete" />
							</button>
						</c:if>
					</form:form>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div id="map_container"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function initMap() {
			var iw = new google.maps.InfoWindow();
			var marker = ${orderJS}
			console.log(marker["coordLat"])
			var createdmarkers = [];
			var ba = {
				lat : 48.14816,
				lng : 17.10674
			};
			var map = new google.maps.Map(document
					.getElementById('map_container'), {
				zoom : 4,
				center : ba
			});
			var marker = new google.maps.Marker({
				position : {
					lat : parseFloat(marker["coordLat"]),
					lng : parseFloat(marker["coordLon"])
				},
				map : map,
			});

		}
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzFAb-50-x7wH2Nfz1s5XzJiHyfRlwT4Y&callback=initMap"></script>
	
</body>
</html>