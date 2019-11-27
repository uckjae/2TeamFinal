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
		// 관광정보 api 
		let contentId = "&contentId=";
		console.log(contentId);
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=인증키&contentTypeId=25&contentId=1952978&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y
		//detailCommon? 공통정보 //detailIntro?   소개정보 //detailInfo? 코스정보 
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";

		var servicekey = "?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
		var paramArea = "&contentTypeId=25&areaCode=1";
		var paramSigungu = "&sigunguCode=";
		var paramCat = "&cat1=C01&cat2=";
		var paramList = "&cat3=&listYN=Y";
		var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=D";
		var paramNumOfRows = "&numOfRows=12";
		var paramPageNo =  "&pageNo=";
		var type = "&_type=json";
		var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
		var api = "";
	 
			api = addr + "detailCommon" + servicekey +paramArea + contentId + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;

			$.getJSON(api,function(data) { 
			var myItem = data.response.body.items.item;
			console.log("api : "  + api);
			console.log("myItem"+myItem);
			$.each(myData, function(index, element){
				$('#detail').append(
					"<div class='row'>"
						+"<div class='col-md-3'>"
							+"<img src='"+ element.firstimage +"' alt='" + element.firstimage2 + "' style='width:100%'>"
						+"</div>"
						+"<div class='col-md-9'>"
							+"<div class='col-md-12'>"
								+ "<a href='RecommendDetail.do?contentId="+element.contentid+"'	>" + element.title
							+"</div>"
							+"<div class='col-md-12'>"
								
							+"</div>"
						+"</div>"
					+"</div><hr>"
				);
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