<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<form id="logoutForm" method="POST" action="${contextPath}/logout">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>

<nav class="navbar navbar-dark bg-faded rounded navbar-expand-sm">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#containerNavbar" aria-controls="containerNavbarCenter"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse mr-auto" id="containerNavbar">
		<a class="navbar-brand" href="/order/index">HandyMan</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/order"><spring:message code="new.order" />
			</a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="#"
				onclick="document.forms['logoutForm'].submit()"><spring:message
						code="logout" /></a></li>
		</ul>
		<select class="nav-select" id="locales">
			<option value="en"><spring:message code="lang.eng" /></option>
			<option value="sk"><spring:message code="lang.sk" /></option>
		</select>
	</div>
</nav>