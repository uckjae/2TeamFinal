<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<title>여행지 메인</title>
<script type="text/javascript">
$(function(){
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D";
	var paramArea = "&contentTypeId=15&areaCode=1";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=&cat2=";
	var paramList = "&cat3=&listYN=Y";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A";
	var paramNumOfRows = "&numOfRows=6";
	var paramPageNo =  "&pageNo=";
	var type = "&_type=json&";
	var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
	var api = "";
	
	api = addr + "areaBasedList?" + addr2 + "1" + type;
	
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		$.each(myData,function(index,element){
			
			$(".content").append("<table border='1'>")
			$(".content").append("<tr>")
			$(".content").append("<td rowspan='2' colspan='2'><img src=" + element.firstimage2 +"></td><td>&nbsp</td>")
			$(".content").append("<td><b>" + element.title + "</b><br>" + element.addr1 + "</td>")
			$(".content").append("</tr>")
			$(".content").append("<tr>")
			$(".content").append("<td>")
			$(".content").append("</td>")
			$(".content").append("</tr>")
			$(".content").append("<hr >")
			
		});
	});
	
	
});
</script>
 <style type="text/css">
        html,
        body {
            height: 100%;
        }
        table{
        	border: 1px;
        	border-style: solid;
        }
        img{
        	width: 150px;
        	height: 113px;
        }
</style> 
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
<div class="content">


</div>

</body>
</html>