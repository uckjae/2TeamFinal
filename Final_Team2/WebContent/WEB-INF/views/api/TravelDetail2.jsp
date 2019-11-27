<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	/*공통정보*/
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var AppTest = "&MobileOS=ETC&MobileApp=AppTest";
	var type = "&_type=json";	
	/*공통Json*/
	var numOfRows = "&numOfRows=10";
	var pageNo = "&pageNo=1";
	var contentTypeId = "&contentTypeId=12";
	var areaCode = "&areaCode=";
	var Sigungu = "&sigunguCode=";
	var pramContentId = "&contentId=";
	
	
	var pramSubImage = "&cat1=&cat2=&cat3=&listYN=Y";
	var pramDetailImage ="detailImage?";
	var pramImage ="&imageYN=Y";
	var pramSubImage ="&subImageYN=Y";
	var pramOverView ="&overviewYN=Y";
	var pramMapInfo = "&mapinfoYN=Y";
	var pramAddrInfo = "&addrinfoYN=Y";
	var pramCatCode = "&catcodeYN=Y";
	var pramDefault = "&defaultYN=Y";
	var pramFirstImage = "&firstImageYN=Y";
	var pramDetailCommon ="detailCommon?";
	var pramAreaCode = "&areacodeYN=Y";
	var pramDetailIntro = "detailIntro?";
	var pramLocationBasedList = "locationBasedList?";
	var pramArrrange ="&arrange=";
	var pramMapX ="&mapX=";
	var pramMapY ="&mapY=";
	var pramRadius = "&radius=3000";
	var pramListYN = "&listYN=Y";
	var api = "";
	var api2 = "";
	var api3 = "";
	var api4= "";
	
	/* http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?
			serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D
			&numOfRows=10
			&pageNo=1
			&MobileOS=ETC&MobileApp=AppTest
			&contentId=1254680
			&contentTypeId=12
			&defaultYN=Y
			&firstImageYN=Y
			&areacodeYN=Y
			&catcodeYN=Y
			&addrinfoYN=Y
			&mapinfoYN=Y
			&overviewYN=Y
			
			http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?
					serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D
					&numOfRows=10
					&pageNo=1
					&MobileOS=ETC&MobileApp=AppTest
					&contentId=1254680
					&contentTypeId=12
					
			http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?
					serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D
					&numOfRows=10
					&pageNo=1
					&MobileOS=ETC&MobileApp=AppTest
					&arrange=A
					&contentTypeId=12
					&mapX=126.981611
					&mapY=37.568477
					&radius=3000
					&listYN=Y
			*/
	
	var api = addr + pramDetailImage + servicekey + numOfRows + pageNo + AppTest 
	            + pramContentId + "1254680" + pramImage + pramSubImage + type;
	
	var api2 = addr + pramDetailCommon + servicekey + numOfRows + pageNo + AppTest
	           + pramContentId + "1254680" + contentTypeId + pramDefault + pramFirstImage + pramAreaCode + pramCatCode + pramAddrInfo
	           + pramMapInfo + pramOverView + type;
	
	var api3 = addr + pramDetailIntro + servicekey + numOfRows + pageNo + AppTest
	           + pramContentId + "1254680" + contentTypeId + type;
	
	var api4 = addr + pramLocationBasedList + servicekey + numOfRows + pageNo + AppTest
	           + pramArrrange + "A" + contentTypeId + pramMapX + "126.981611" + pramMapY + "37.568477" + pramRadius + pramListYN + type;
	/*이미지정보조회*/
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		
      /* $.each(myData,function(index,element){
			
			$(".content").append("<table border='1'>")
			$(".content").append("<tr>")
			$(".content").append("<td rowspan='2' colspan='2'><img src=" + element.originimgurl+" onError=\"this.src='images/default.png'\"></td><td>&nbsp</td>")
			$(".content").append("</tr>")
			$(".content").append("<tr>")
			$(".content").append("<td>")
			$(".content").append("</td>")
			$(".content").append("</tr>")
			$(".content").append("<hr >")
			
		}); */
      
	});
	/*공통정보조회*/
	$.getJSON(api2,function(data){
		var myData2 = data.response.body.items.item;
		console.log(myData2);	
		
		$.each(myDate2,function(key,value){
			$(".content").append("<strong>"+상세정보+"</strong>")
		});
	});
	/*상세정보조회*/
	$.getJSON(api3,function(data){
		var myData3 = data.response.body.items.item;
		console.log(myData3);		
	});
	/*위치기반정보조회*/
	$.getJSON(api4,function(data){
		var myData4 = data.response.body.items.item;
		console.log(myData4);		
	});

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
    <div class="content">
       <strong>상세정보</strong>

</div>
</body>
</html>