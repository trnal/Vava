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
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
			<a class="navbar-brand" href="/order/index">HandyMan</a>

			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/order">New
						Order</a></li>
			</ul>
		</nav>

		<!-- Form -->
		<div class="col-xs-12 col-sm-10 col-offset-sm-1 col-md-6 col-offset-md-3">
			<h2>Create account</h2>

			<form method="POST" action="/users/store">
				<div class="form-group">
					<label>Nickname:</label> <input type="text" name="nickname"
						value="" placeholder="John" class="form-control" required>
				</div>

				<div class="form-group">
					<label>Email:</label> <input type="email" name="email" value=""
						placeholder="john@carrot.com" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Password:</label> <input type="password" name="password"
						value="" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Confirm Password:</label> <input type="password"
						name="confirmPassword" value="" class="form-control" required>
				</div>
				<div class="form-group">
					<label>I can help with:</label>
					<textarea rows="5" name="abilities" placeholder="I can help with broken computers and network connection."
						class="form-control"></textarea>
				</div>

				<button type="submit" class="btn btn-primary">SignUp</button>

			</form>

		</div>

	</div>

</body>


</html>