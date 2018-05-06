<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<a class="navbar-brand" href="/order/index">HandyMan</a>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/order"><spring:message code="new.order"/></a></li>
		<c:if test="${not empty pageContext.request.userPrincipal}">
    		<form id="logoutForm" method="POST" class="nav-item" action="${contextPath}/logout" style="cursor: pointer;">
				<a class="nav-link" onclick="document.forms['logoutForm'].submit()"><spring:message code="logout"/></a>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</c:if>		
	</ul>
	<select id="locales">
	    <option value=""></option>
	    <option value="en"><spring:message code="lang.eng"/></option>
	    <option value="sk"><spring:message code="lang.sk"/></option>
	</select>
</nav>