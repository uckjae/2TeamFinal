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
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D";
	var paramArea = "&contentTypeId=15&areaCode=1";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=&cat2=";
	var paramList = "&cat3=&listYN=Y";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=2509701";
	var paramNumOfRows = "&numOfRows=6";
	var paramPageNo =  "&pageNo=";
	var type = "&_type=json&";
	var etc = "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
	var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
	var api = "";
	api = addr + "detailCommon?" + addr2 + "1" + type + etc;
	
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
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
	
	
});
</script>
</head>
<body>
<div class="content">

</div>
</body>
</html>