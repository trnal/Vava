<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
	<jsp:include page="/partials/head.jsp"></jsp:include>
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