<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="/common/HeadTag.jsp" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>코스 상세보기</title>
	<style type="text/css">
		html,
		body {
			height: 100%;
		}
	</style>
<script type="text/javascript">
	$(function() {
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";

		var servicekey = "?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
		var paramArea = "&contentTypeId=25&areaCode=1";
		var contentId = "&contentId="+${requestScope.contentId};
		var forCommon = "&defaultYN=Y&firstImageYN=Y";
		var type = "&_type=json";
		var apiDetail = "";
		var apiCommon = "";
		var apiIntro = "";
		
		apiDetail = addr + "detailInfo" + servicekey +paramArea +contentId  + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;
		apiIntro = addr + "detailIntro" + servicekey +paramArea +contentId  + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;
		apiCommon = addr + "detailCommon" + servicekey +paramArea +contentId + forCommon +"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;
		
		$.getJSON(apiCommon,function(data){
			console.log("common");
			console.log(data);
			var titleData = data.response.body.items.item.title;
			console.log(titleData);
			$("#title").text(titleData);
		});
		
		$.getJSON(apiIntro,function(data){
			console.log("intro");
			console.log(data);
			distanceData = data.response.body.items.item.distance;
			takeTimeData = data.response.body.items.item.taketime;
			console.log(data.response.body.items.item);
			$("#distance").text(distanceData);
			$("#takeTime").text(takeTimeData);
			
		});
		
		$.getJSON(apiDetail,function(data) { 
			 var myItem = data.response.body.items.item;
			 console.log("detail");
			 console.log(data);
			 console.log(myItem)
		});
		$.getJSON(api, function(data) {
			let myItem = data.response.body.items.item;
			
			console.log("myItem" + apiCommon);
			$.each(apiCommon, function(index, element) {
				$('#deil').append(
						"<div class='row'>" + "<div class='col-md-3'>"
								+ "<img src='" + element.firstimage + "' alt='"
								+ element.firstimage2 + "' style='width:100%'>"
								+ "</div>" + "<div class='col-md-9'>"
								+ "<div class='col-md-12'>"
								+ "" + element.title
								+ "</div>" + "<div class='col-md-12'>"
								+ "</div>" + "</div>" + "</div><hr>");
			});
		});

	});
</script>        
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<c:set var="currUser" value="${sessionScope.memberId }"/>
	
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    <div class="container">
    	<div id="mainContentBox" class="content">
			<div class="row">
				<div class="col-md-4" class="1">1</div>
				<div class="col-md-4" class="2">2</div>
				<div class="col-md-4" class="3">3</div>
			</div>
		</div>
    </div>
</body>
</html>