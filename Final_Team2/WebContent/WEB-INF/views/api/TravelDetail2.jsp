<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<title>Insert title here</title>

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
	
	
	var pramcontentId = "&contentId=";
	var pramsubImage = "&cat1=&cat2=&cat3=&listYN=Y";
	var pramdetailImage ="detailImage?";
	var pramImage ="&imageYN=Y";
	var pramSubImage ="&subImageYN=Y";
	var pramOverView ="&overviewYN=Y";
	var pramMapInfo = "&mapinfoYN=Y";
	var pramAddrInfo = "&addrinfoYN=Y";
	var pramCatCode = "&catcodeYN=Y";
	var pramDefault = "&defaultYN=Y";
	var pramFirstImage = "&firstImageYN=Y";
	var pramDetailCommon ="detailCommon?";
	var api = "";
	var api2 = "";
	var api3 = "";
	
	http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?
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
	
	var api = addr + pramdetailImage + servicekey + numOfRows + pageNo + AppTest 
	            + pramcontentId + "1254680" + pramImage + pramSubImage + type;
	
	var api2 = addr + pramDetailCommon + servicekey + numOfRows + pageNo + AppTest
	           + pramcontentId + "1254680" + contentTypeId + 
	
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		
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
</body>
</html>