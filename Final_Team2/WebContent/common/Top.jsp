<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="member" value="${sessionScope.member}" />
<c:choose>
	<c:set var="isAdmin" value="false" />
	<c:when test="${member != null}">
		<c:set var="isLogin" value="true" />

	</c:when>
	<c:otherwise>
		<c:set var="isLogin" value="false" />
	</c:otherwise>
</c:choose>  --%> 

<!DOCTYPE html>
<html>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Team2</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item"><a href="#services-section"
						class="nav-link"><span>Services</span></a></li>
					<li class="nav-item"><a href="#about-section" class="nav-link"><span>About</span></a></li>
					<li class="nav-item"><a href="#destination-section"
						class="nav-link"><span>Destination</span></a></li>
					<li class="nav-item"><a href="#hotel-section" class="nav-link"><span>Hotel</span></a></li>
					<li class="nav-item"><a href="#restaurant-section"
						class="nav-link"><span>Restaurant</span></a></li>
					<li class="nav-item"><a href="#blog-section" class="nav-link"><span>Blog</span></a></li>
					<li class="nav-item"><a href="#contact-section"
						class="nav-link"><span>Contact</span></a></li>
					<%-- <c:choose>
						<c:when test="${isLogin== 'true'}">
							<li class="nav-item"><a href="Logout.do" class="nav-link"><span>Logout</span></a></li>
							<c:choose>
								<c:when test="${isAdmin== 'true'}">
									<li class="nav-item"><a href="Logout.do" class="nav-link"><span>관리자</span></a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a href="Logout.do" class="nav-link"><span>마이페이지</span></a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a href="Login.do" class="nav-link"><span>Login</span></a></li>
						</c:otherwise>
					</c:choose> --%>

				</ul>
			</div>
		</div>
	</nav>
</body>
</html>