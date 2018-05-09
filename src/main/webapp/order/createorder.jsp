<%@ include file="/partials/prefix.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
<link href="/resources/main.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<jsp:include page="/partials/navigation.jsp"></jsp:include>

		<form method="POST" action="/order" class="row">

			<div class="col-xs-12 col-md-6">
				<h2>
					<spring:message code="order.new" />
				</h2>
				<div class="form-group">
					<label><spring:message code="order.name" />:</label> <input
						type="text" name="name" value=""
						placeholder="<spring:message code="order.name.placeholder"/>"
						class="form-control">
				</div>
				<div class="form-group">
					<label><spring:message code="order.category" />:</label> <select
						name="categoryId" class="form-control">
						<option value="0">Motory autá</option>
						<option value="1">Motory motorky</option>
						<option value="2">Práčky</option>
					</select>
				</div>

				<div class="form-group">
					<label><spring:message code="order.description" />:</label>
					<textarea name="description"
						placeholder="<spring:message code="order.description.placeholder"/>"
						class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label><spring:message code="order.phone.number" />:</label> <input
						type="text" name="phoneNumber" value="" placeholder="0944112233"
						class="form-control">
				</div>

				<button type="submit" class="btn btn-lg btn-primary w-100 mb-4 mt-1">Send</button>
			</div>
			<div class="col-xs-12 col-md-6">
				<input id="pac-input" class="controls" type="text" placeholder="Search Box">
				<div id="map_container"></div>
				<div class="form-group">
					<label><spring:message code="order.address" />:</label> <input
						type="text" name="address" value="" placeholder="Pekná cesta3"
						class="form-control" id="address" readonly>
				</div>
				<div class="form-group">
					<label><spring:message code="order.town" />:</label> <input
						type="text" name="town" value="" placeholder="Bratislava"
						class="form-control" id="town" readonly>
				</div>

				<input hidden="true" id="map-long" name="coordLon" value="48.14816">
				<input hidden="true" id="map-lat" name="coordLat" value="17.10674">

			</div>
		</form>
	</div>


	<script type="text/javascript" src="/resources/map-createorder.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzFAb-50-x7wH2Nfz1s5XzJiHyfRlwT4Y&callback=initMap&libraries=places"></script>
	
</body>


</html>