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
 </body>
</html>