<%@ include file="/partials/prefix.jsp" %>

<nav class="navbar navbar-dark bg-faded rounded navbar-expand-sm">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#containerNavbar" aria-controls="containerNavbarCenter"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse mr-auto" id="containerNavbar">
		<a class="navbar-brand" href="/order/index">HandyMan</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/order"><spring:message code="order.new"/></a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<c:if test="${not empty pageContext.request.userPrincipal}">
	    		<form id="logoutForm" method="POST" class="nav-item" action="${contextPath}/logout" style="cursor: pointer;">
					<a class="nav-link" onclick="document.forms['logoutForm'].submit()"><spring:message code="logout"/></a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</c:if>		
		</ul>
		<select class="nav-select"  id="locales">
			<option value=""></option>
		    <option value="en"><spring:message code="lang.eng"/></option>
		    <option value="sk"><spring:message code="lang.sk"/></option>
		</select>
	</div>
</nav>