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
		let addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		let service = "serviceKey="+servicekey;
		let paramArea = "&contentTypeId=25&areaCode=1";
		let paramSigungu = "&sigunguCode=";
		let paramCat = "&cat1=C01&cat2=";
		let paramList = "&cat3=&listYN=Y";
		let paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B";
		let paramNumOfRows = "&numOfRows=3";
		let paramPageNo =  "&pageNo=1";
		let type = "&_type=json";
		let addr2 = service + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
		let api = addr + "areaBasedList?" + addr2 + type;
		
		$.getJSON(api, function(data) {
			let myItem = data.response.body.items.item;
			console.log("api : " + api);
			console.log("myItem" + myItem);
			$.each(myItem, function(index, element) {
				$('#detail').append(
						"<div class='row'>" + "<div class='col-md-3'>"
								+ "<img src='" + element.firstimage + "' alt='"
								+ element.firstimage2 + "' style='width:100%'>"
								+ "</div>" + "<div class='col-md-9'>"
								+ "<div class='col-md-12'>"
								+ "<a href='RecommendDetail.do?contentId="
								+ element.contentid + "'	>" + element.overview
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
    <div class="content">
    	<div class="row">
   			<h1 class="text-center" id="title">title</h1>
    	</div>
   		<div class="row">
   			<div class="text-right">
   				<span id="detail">1</span>
   				&nbsp;&nbsp;&nbsp;
   				<span id="takeTime">2</span>
   			</div>
   		</div>
    </div>
</body>
</html>