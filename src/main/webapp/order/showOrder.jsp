<%@ include file="/partials/prefix.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/partials/head.jsp"></jsp:include>
</head>

<body>

	<div class="container aaa">

		<!-- top navigation -->
		<jsp:include page="/partials/navigation.jsp"></jsp:include>
		<!-- Detail -->
		<div
			class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
			<h2>${order.getName()}</h2>
			<div>${order.getTown()}</div>
			<div>${order.getAddress()}</div>
			<div>${order.getDescription()}</div>
			<div>${order.getPhoneNumber()}</div>
		</div>
		<form:form method="PUT" action="/order/delete">
			<input hidden name="orderId" value="${order.getId()}"></input>
			<c:if test="${authenticatedUser == true}" >
			<button type="submit">Vymazať</button>
		</c:if>
		</form:form>

	</div>

</body>
</html>