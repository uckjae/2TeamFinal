<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<jsp:include page="/common/DataTableTag.jsp"></jsp:include>
<title>여행지 메인</title>
<script type="text/javascript">
$(function(){
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var paramArea = "&contentTypeId=12&areaCode=2";
	var paramSigungu = "&sigunguCode=";
	var paramList = "&cat1=&cat2=&cat3=&listYN=Y";
	var paramAppTest = "&MobileOS=ETC&MobileApp=AppTest";
	var paramArrange ="&arrange=A";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=";
	var type = "&_type=json";
	var addr2 = servicekey + paramArea + paramSigungu + paramList + paramAppTest+ paramArrange+ paramNumOfRows + paramPageNo;
	var api = "";
	
	api = addr + "areaBasedList?" + addr2 + "1" + type;
	//http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode=2&sigunguCode=1&eventStartDate=20170901
	
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		
          $.each(myData,function(index,element){
			
			$(".content").append("<table border='1'>")
			$(".content").append("<tr>")
			$(".content").append("<td rowspan='2' colspan='2'><img src=" + element.firstimage+" onError=\"this.src='images/default.png'\"></td><td>&nbsp</td>")
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
         width:150px;
         hight:113px;
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
