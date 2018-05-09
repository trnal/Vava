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
				<div class="col-xs-12 col-sm-6">
					<h2>${order.getName()}</h2>
					<div>${order.getDescription()}</div>
					<div>${order.getPhoneNumber()}</div>
					<div>${order.getTown()}</div>
					<div>${order.getAddress()}</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div id="map_container"></div>
				</div>
			</div>
			<div class="row">
				<form:form id="delete-form" method="POST" action="/order/delete">
					<input hidden name="orderId" value="${order.getId()}"></input>
					<c:if test="${authenticatedUser == true}">
						<button type="submit">
							<spring:message code="order.delete" />
						</button>
					</c:if>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>