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
	
	function goCourseDetail(ogu) {
		console.log($(ogu).val());
		location.href = "TravellDetail.do?contentId=" + $(ogu).val();
	}
	
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var paramArea = "&contentTypeId=12&areaCode=2";
	var paramSigungu = "&sigunguCode=";
	var paramCat = "&cat1=&cat2=";
	var paramList = "&cat3=&listYN=Y";
	var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=";
	var type = "&_type=json&";
	var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
	var api = "";
	
	api = addr + "searchFestival?" + addr2 + "1" + type;
	
	/*
	http://api.visitkorea.or.kr/openapi/service/rest/KorService/
	areaBasedList?
	serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D
	&pageNo=1
	&numOfRows=10
	&MobileApp=AppTest
	&MobileOS=ETC
	&arrange=A
	&contentTypeId=12
	&areaCode=2
	&listYN=Y
	*/
	
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
		$.each(myData,function(index,element){
			$('#dataBox').append(
					"<div class='row'>"
						+"<div class='col-md-3'>"
							+"<img src="+ element.firstimage2 + ">"
						+"</div>"
						+"<div class='col-md-9'>"
							+"<div class='col-md-12'>"
								+ "<a href='TravelDetail.do?contentId="+ element.contentid+"&mapx=" + element.mapx +"&mapy="+element.mapy +"'>" + element.title
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

<div id="mainContentBox" class="content">
			<div class="row">
				<div class="col-md-4">1</div>
				<div class="col-md-4">2</div>
				<div class="col-md-4">3</div>
			</div>
		</div>
<div  id="dataBox"></div>
<div class="pagination-sm mt-3 mb-3" style="text-align:center">
			    <a href="#" class="btn btn-primary">&laquo;</a>
				<a href="#" class="btn btn-primary">1</a>
				<a href="#" class="btn btn-primary">2</a>
				<a href="#" class="btn btn-primary">3</a>
				<a href="#" class="btn btn-primary">4</a>
				<a href="#" class="btn btn-primary">5</a>
				<a href="#" class="btn btn-primary">&raquo;</a>
			</div>
</div>

</body>
</html>
