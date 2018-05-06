<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	<a class="navbar-brand" href="/order/index">HandyMan</a>

	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/order">New
				Order</a></li>
		<li class="nav-item">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <a class="nav-link"
					onclick="document.forms['logoutForm'].submit()">Logout</a>
			</form>
		</li>
	</ul>
</nav>