<%@ include file="/partials/prefix.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
</head>

<body>

	<div class="container login">
	<!-- top navigation -->
	<jsp:include page="/partials/navigation.jsp"></jsp:include>
		
		<div class="col-xs-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3 login-panel">
			<form:form method="POST" modelAttribute="userForm" class="form-signin">
				<h2 class="form-signin-heading mb-4">Create your account</h2>
				<spring:bind path="username">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="text" path="username" class="form-control"
							placeholder="Username" autofocus="true"></form:input>
						<form:errors path="username"></form:errors>
					</div>
				</spring:bind>
				<spring:bind path="email">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="e-mail" path="email"
							class="form-control" placeholder="Insert your email"></form:input>
						<form:errors path="passwordConfirm"></form:errors>
					</div>
				</spring:bind>
				<spring:bind path="abilities">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="text" path="abilities"
							class="form-control" placeholder="I can help with network..."></form:input>
						<form:errors path="abilities"></form:errors>
					</div>
				</spring:bind>
				<spring:bind path="password">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="password" path="password" class="form-control"
							placeholder="Password"></form:input>
						<form:errors path="password"></form:errors>
					</div>
				</spring:bind>
	
				<spring:bind path="passwordConfirm">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="password" path="passwordConfirm"
							class="form-control" placeholder="Confirm your password"></form:input>
						<form:errors path="passwordConfirm"></form:errors>
					</div>
				</spring:bind>
	
				<button type="submit" class="btn btn-lg btn-primary w-100">Register</button>
				<h3 class="text-center mt-3"><a href="${contextPath}/login">I already have an account</a></h3>
			</form:form>
		</div>
	</div>
	<!-- /container -->
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>