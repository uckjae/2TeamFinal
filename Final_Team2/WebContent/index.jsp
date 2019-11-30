<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/common/HeadTag.jsp" />
<title>이곳저곳</title>
<style type="text/css">
	html, body{
		height: 100%;
	}
	
	#main{
		background-repeat : no-repeat;
		background-size : cover;
		background-image: url("images/mainimg.jpg");
		width: 100%; 
		height: 100%;
	}
</style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	
	<div id="main">
	<br><br><br><br><br>
		<h1> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2조 파이팅 !!! </h1>
	</div>
	
	<script src="js/main.js"></script>
</body>
</html>