<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D -->
	<meta charset="UTF-8">
	<c:import url="/common/HeadTag.jsp" />
	<title>코스</title>
	<script type="text/javascript">
	$(function(){
		
		let serviceKey = "?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
		
		let api = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/"
				+ servieeKey + "&contentTypeId=25&areaCode=1&cat1=C01&cat2=&cat3=&listYN=Y"
				+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=&_type=json";
		
	});
	</script>
	<style type="text/css">
		html,
		body {
			height: 100%;
		}
	</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    <div class="container">
    	
    </div>
</body>
</html>