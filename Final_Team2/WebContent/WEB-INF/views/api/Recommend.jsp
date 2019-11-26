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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		/* http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList
		?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D
				&contentTypeId=25&areaCode=&sigunguCode=&cat1=C01&cat2=&cat3=
					&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=12&pageNo=1&_type=json */
					
		let area = [{name : "서울", code : 1}
					, {name : "경기도", code : 31}
					, {name : "인천", code : 2}];
		let serviceKey = "?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
		
		for(let i = 0; i < area.length; i++)
		let api = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList/"
				+ serviceKey + "&contentTypeId=25&areaCode="+ area[i].code +"&cat1=C01&cat2=&cat3=&listYN=Y"
				+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=12&pageNo=&_type=json";
		}
		
		$.getJSON(api,function(data) { 
			 var myItem = data.response.body.items.item;
			 console.log("api : "  + api);
			 $.each(myItem,function(index,element){
				 
				$(".content").append( "<h3>"+element.subnum +"코스 : </strong>&nbsp; "+ element.subname +" </h3>");				
				$(".content").append( "<img src ='"+ element.subdetailimg + "'/>");
				$(".content").append("<p>"+element.subdetailoverview+"</p>");
			 }
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