<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<a class="navbar-brand" href="/order/index">HandyMan</a>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/order"><spring:message code="new.order"/></a></li>
		<li class="nav-item">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <a class="nav-link"
					onclick="document.forms['logoutForm'].submit()"><spring:message code="logout"/></a>
			</form>
		</li>
	</ul>
	<select id="locales">
	    <option value=""></option>
	    <option value="en"><spring:message code="lang.eng"/></option>
	    <option value="sk"><spring:message code="lang.sk"/></option>
	</select>
</nav>