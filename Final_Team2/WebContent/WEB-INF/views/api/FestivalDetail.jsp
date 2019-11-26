<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<c:import url="/common/HeadTag.jsp" />
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	//공통으로 쓰이는 변수
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D";
	var type = "&_type=json&";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=2509701";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=1";
	//공통정보조회 변수
	var paramArea = "&contentTypeId=15&areaCode=1";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=&cat2=";
	var paramList = "&cat3=&listYN=Y";
	var etc = "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
	var addr2 = servicekey + paramNumOfRows + paramPageNo +paramArrange;
	var api = "";
	api = addr + "detailCommon?" + addr2  + type + etc;
	
	
	//소개정보조회 변수
	var contentType = "&contentTypeId=15";
	var api2 = "";
	var addr3 = servicekey  + paramNumOfRows + paramPageNo + paramArrange;
	api2 = addr + "detailIntro?" +  addr3  + type + contentType;
	
	
	//이미지 조회변수
	var etc2 = "&imageYN=Y&subImageYN=Y";
	var api3 = "";
	var addr4 = servicekey + paramNumOfRows + paramPageNo + paramArrange;
	api3 = addr + "detailImage?" + addr4 + type + etc2;
	
	//http://api.visitkorea.or.kr/openapi/service/rest/KorService/
	//locationBasedList?
	//serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D
	//&numOfRows=10
	//&pageNo=1
	//&MobileOS=ETC&MobileApp=AppTest
	//&arrange=E
	//&contentTypeId=15
	//&mapX=127.1109831778
	//&mapY=37.4960925880
	//&radius=3000&listYN=Y
	//위치 기반 변수
	var x = "&mapX=127.1109831778";
	var y = "&mapY=37.4960925880";
	var arrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide";
	var array = "&arrange=E";
	var range = "&radius=3000&listYN=Y";
	var api4 = "";
	var addr5 = servicekey + paramNumOfRows + paramPageNo + arrange + array + contentType + x + y + range;
	api4 = addr + "locationBasedList?" + addr5 + type;
	
	
	
	//공통정보 JSON each문
	$.getJSON(api,function(data){
		var myData = data;
		console.log(myData);
		//$.each(myData,function(index,element){
			
			/* $(".content").append("<table border='1'>")
			$(".content").append("<tr>")
			$(".content").append("<td rowspan='2' colspan='2'><img src=" + element.firstimage2 +"></td><td>&nbsp</td>")
			$(".content").append("<td><b>" + element.title + "</b><br>" + element.addr1 + "</td>")
			$(".content").append("</tr>")
			$(".content").append("<tr>")
			$(".content").append("<td>")
			$(".content").append("</td>")
			$(".content").append("</tr>")
			$(".content").append("<hr >") */
			
		//});
	});
	//end
	
	//소개정보 JSON
	$.getJSON(api2,function(data2){
		var myData2 = data2;
		console.log(myData2);
		
		
	});
	
	//이미지 정보 JSON
	$.getJSON(api3,function(data3){
		var myData3 = data3;
		console.log(myData3);
	});
	
	
	$.getJSON(api4,function(data4){
		var myData4 = data4;
		console.log(myData4);
	});
	
	
	
});
</script>
</head>
<body>
<div class="content">

</div>
</body>
</html>