<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<c:import url="/common/HeadTag.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/timeLine.css">
<title>Insert title here</title>
<style type="text/css">
	.position {
		position: relative;
   	    margin-top: 3em;
        margin-left: 10em;
        margin-right: 10em;
        }
	 li {
		list-style-position: inside;
		 text-indent: -18px;
		padding-left:18px;
		list-style-type: none;
	}
	ul {
		padding-inline-start: 0px;
	}
 	body {
		color: black;
	}
		
</style>
<script type="text/javascript">
$(function(){
	//공통으로 쓰이는 변수
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D";
	var type = "&_type=json&";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=1";
	var contentid = "${requestScope.contentId}";
	//공통정보조회 변수
	var paramArea = "&contentTypeId=15&areaCode=1";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=&cat2=";
	var paramList = "&cat3=&listYN=Y";
	var etc = "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
	var addr2 = servicekey + paramNumOfRows + paramPageNo +paramArrange + contentid;
	var apicommon = "";
	apicommon = addr + "detailCommon?" + addr2  + type + etc;
	
	
	//소개정보조회 변수
	var contentType = "&contentTypeId=15";
	var apidetail = "";
	var addr3 = servicekey  + paramNumOfRows + paramPageNo + paramArrange + contentid;
	apidetail = addr + "detailIntro?" +  addr3  + type + contentType;
	
	
	//이미지 조회변수
	var etc2 = "&imageYN=Y&subImageYN=Y";
	var apiimage = "";
	var addr4 = servicekey + paramNumOfRows + paramPageNo + paramArrange + contentid; 
	apiimage = addr + "detailImage?" + addr4 + type + etc2;
	
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
	var x = "&mapX=${requestScope.xposition}";
	var y = "&mapY=${requestScope.yposition}";
	var arrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide";
	var array = "&arrange=E";
	var range = "&radius=3000&listYN=Y";
	var apilocation = "";
	var addr5 = servicekey + paramNumOfRows + paramPageNo + arrange + array + contentType + x + y + range;
	apilocation = addr + "locationBasedList?" + addr5 + type;
	
	
	
	//공통정보 JSON each문
	$.getJSON(apicommon,function(data){
		var myData = data.response.body.items.item;
		console.log("공통정보");
		console.log(myData);
		$("#title").text(myData.title);
		$.each(myData,function(key,value){
			if(key=="overview"){
				$("#overview").append("<hr>");
				$("#overview").append("<h3><b>축제 정보</b></h3>");
				$("#overview").append("<div>" + value + "</div>");
				$("#overview").append("<hr>");	
				$("#overview").append("<h3><b>상세정보</b></h3>");
			}else if(key =="homepage"){
				$('#url').append("<ul><li>회사 URL " + value + "</li></ul>");
			}
			
			
		});
		
	});
	//end
	
	//소개정보 JSON
	$.getJSON(apidetail,function(data2){
		var myData2 = data2.response.body.items.item;
		console.log("소개정보")
		console.log(myData2);
		$.each(myData2,function(key,value){			
			if(key == "eventplace"){
				$("#content").append("<ul><li>주소 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;" + value + "</li></ul>");	
				}else if(key == "eventenddate"){
					$("#info").append("<ul><li>종료날짜  &nbsp;&nbsp;&nbsp;" + value + "</li></ul>");	
					}
				else if(key == "sponsor1"){
						$("#content").append("<ul><li>주관   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;" + value + "</li><ul>");
						}
				else if(key == "sponsor1tel"){
							$("#content").append("<ul><li>전화번호 &nbsp;&nbsp;&nbsp;" + value + "</li></ul>");
								}
				else if(key == "sponsor2"){
									$("#info").append("<ul><li>주관 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;" + value + "</li><ul>");
									}
				else if(key == "eventstartdate"){
									$("#content").append("<ul><li>시작날짜   &nbsp;&nbsp;&nbsp;" + value + "</li><ul>");
								}else if(key == "sponsor2tel"){
									$("#info").append("<ul><li>전화번호 &nbsp;&nbsp;&nbsp;" + value + "</li></ul>");
								}else if(key == "playtime"){
									$("#info").append("<ul><li>시간 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;" + value + "</li></ul>");
								}else if(key == "usetimefestival"){
									$("#content").append("<ul><li>이용요금 &nbsp;&nbsp;&nbsp;" + value + "</li><ul>");
									
								}
					
									
		});
		$("#content").append("<hr>");
	
	});
	
	//이미지 정보 JSON
	$.getJSON(apiimage,function(data3){
		var myData3 = data3.response.body.items.item;
		
		console.log("이미지");
		console.log(myData3);
		$.each(myData3,function(index,element){
			$("#imgarea").append("<img src='" + element.originimgurl + "'>");
			
		});
		
	});
	
	
	$.getJSON(apilocation,function(data4){
		var myData4 = data4.response.body.items.item;
		
		console.log("위치");
		console.log(myData4);
	});
	
	
});
</script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
<c:import url="/common/Top.jsp" />
	<section class="ftco-section">
	<div class="row">

	<!-- 제목 -->
	<div class=" position" style="width: 80%; text-align: left">
		<div class="row">
			<div class="col-10">
				<h1 id="title"></h1>
			</div>
			<jsp:include page="/common/MoreButton.jsp">
				<jsp:param value="link" name=""/>
			</jsp:include>
		</div>
		<hr>
	</div>

		<center>
			<div id="imgarea" class ="position">
		
			</div>
	</center>
			<div id="overview" class="position" style="width: 80%; text-align: left">

</div>
	

<div class="position" id="content" >
	
</div>
<div class="position" id="info">

</div>
<div class="position" id="url">

</div>
<div class="position" id="map">

</div>
</div>
</section>

	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng("${requestScope.yposition}", "${requestScope.xposition}"), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var markerPosition  = new kakao.maps.LatLng("${requestScope.yposition}", "${requestScope.xposition}"); 
	
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);
	</script>
</body>

</html>