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
</style>

</head>


<body>

	<div class="container">
		<!-- top navigation -->
		<jsp:include page="/partials/navigation.jsp"></jsp:include>
	
		<!-- top navigation -->
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<a class="navbar-brand" href="/order/index">HandyMan</a>

			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/order">New
						Order</a></li>
			</ul>
		</nav>

		<!-- Profile -->
		<div
			class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
			<h2>Filip Stasnty</h2>
			<div>Opravim pracku.
			</div>

		</div>

	</div>

</body>


</html>