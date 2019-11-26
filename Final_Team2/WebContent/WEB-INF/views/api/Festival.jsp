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
	var paramArea = "&contentTypeId=15&areaCode=2";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=A02&cat2=A0207";
	var paramList = "&cat3=A02070100&listYN=Y";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=2";
	var type = "&_type=json&";
	var date = "eventStartDate=20170901";
	var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo + date;
	var api = "";
	
	api = addr + "searchFestival?" + addr2 + type;
	
	$.getJSON(api,function(data){
		var myData = data.response.body;
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
    <div class="content">   
    </div>

</body>
</html>