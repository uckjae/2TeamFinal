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
	$(function() 
		// 관광정보 api 
		
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
	 
			api = addr + "detailInfo" + servicekey +paramArea +"&contentId=" +2044565 + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;

			$.getJSON(api,function(data) { 
			var myItem = data.response.body.items.item;
			console.log("api : "  + api);
			console.log("myItem"+myItem);
			$.each(myItem,function(index,element){
				$(".content").append( "<h3>"+element.subnum +"코스 : </strong>&nbsp; "+ element.subname +" </h3>");				
				$(".content").append( "<img src ='"+ element.subdetailimg + "'/>");
				$(".content").append("<p>"+element.subdetailoverview+"</p>");
				
			 });
			
		});
	
	});
</script>        
</head>