<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/partials/head.jsp"></jsp:include>
</head>

<body>

<div class="container">
	<!-- top navigation -->
	<jsp:include page="/partials/navigation.jsp"></jsp:include>
	<div class="row">
		<div class="col-xs-12 col-sm-10 offset-sm-1 col-md-6 offset-md-3">
			<h1>Log in</h1>
		    <form method="POST" action="${contextPath}/login" class="form-signin">
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
		        <div class="form-group">
		            <span>${message}</span>
		            <input name="username" type="text" class="form-control" placeholder="Username"
		                   autofocus="true"/>
		         </div>
		         <div class="form-group">
		         	<input name="password" type="password" class="form-control" placeholder="Password"/>
		         </div>          
		         <div class="form-group ${error != null ? 'has-error' : ''}">
		         	<span>${error}</span>
		         </div>   
		       
	            <button class="btn btn-lg btn-primary btn-block col-xs-3" type="submit">Log In</button>
	            <h3 class="text-center"><a href="${contextPath}/registration">Create an account</a></h3>
		        
		    </form>
		</div>
	</div>	
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>