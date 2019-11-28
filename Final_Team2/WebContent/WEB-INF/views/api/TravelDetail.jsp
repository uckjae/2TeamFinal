<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<c:import url="/common/HeadTag.jsp" />
<link rel="stylesheet" href="css/timeLine.css">
<title>Insert title here</title>
<style type="text/css">
.position {
	position: relative;
	margin-top: 3em;
	margin-left: 10em;
	margin-right: 10em;
}

</style>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function(){
	
	
	/*공통정보*/
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var AppTest = "&MobileOS=ETC&MobileApp=AppTest";
	var type = "&_type=json";	
	/*공통Json*/
	var numOfRows = "&numOfRows=10";
	var numOfRows2 = "&numOfRows=1";
	var pageNo = "&pageNo=1";
	var contentTypeId = "&contentTypeId=12";
	var areaCode = "&areaCode=";
	var Sigungu = "&sigunguCode=";
	var pramContentId = "${requestScope.contentId}";
	
	
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
	var pramDetailInfo = "detailInfo?";
	var api = "";
	var api2 = "";
	var api3 = "";
	var api4= "";
	
	/* 
	http://api.visitkorea.or.kr/openapi/service/rest/KorService/
	detailInfo?
	serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D
	&numOfRows=10
	&pageNo=1
	&MobileOS=ETC&MobileApp=AppTest
	&contentId=1254680
	&contentTypeId=12
	
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
	
	var api5 = addr + pramDetailInfo + servicekey + numOfRows2 + pageNo + AppTest
	            + pramContentId + "1254680" + contentTypeId + type;
	
	/*이미지정보조회*/
	$.getJSON(api,function(data){
		var myData = data.response.body.items.item;
		console.log(myData);
      
	});
	/*공통정보조회*/
	$.getJSON(api2,function(data){
		var myData2 = data.response.body.items.item;
		console.log("공통정보");
		console.log(myData2);	
		
		$.each(myData2,function(key,value){
			console.log(key);
			if(key=="overview"){
			
			$("#MainContent").append("<br>");
			$("#MainContent").append("<hr>");
			$("#MainContent").append("<h3>여행정보</h3>");
			$("#MainContent").append("<br>");
			$("#MainContent").append("<div>" + value + "</div>");
			$("#MainContent").append("<hr>");
			$("#MainContent").append("<h3>상세정보</h3>");
			$("#MainContent").append("<br>");
			
			}
			else if(key=="addr1"){ //주소	 
			 $("#addrContent").append("<div>"+value+"</div>");	
			 $("#addrContent").append("<br>");
			 $("#addrContent").append("<br>");
			 $("#addrContent").append("<br>");
			 
			}else if(key=="homepage"){	 //홈페이지
			 $("#DetailContent").append("<div>"+value+"</div>");
			 $("#DetailContent").append("<br>");
			 $("#DetailContent").append("<br>");
			 $("#DetailContent").append("<br>");
			}
		});
	});
	/*상세정보조회*/
	$.getJSON(api3,function(data){
		var myData3 = data.response.body.items.item;
		console.log(myData3);
		
		$.each(myData3,function(key,value){ 
			console.log(key);
			if(key=="restdate"){ //휴무
			$("#RestdateContent").append("<div>" + value + "</div>");
			$("#RestdateContent").append("<br>");
			$("#RestdateContent").append("<br>");
			$("#RestdateContent").append("<br>");
			}
			else if(key=="usetime"){//이용시간			
			$("#UsetimeContent").append("<div>" + value + "</div>");
			$("#UsetimeContent").append("<br>");
			$("#UsetimeContent").append("<br>");
			$("#UsetimeContent").append("<br>");
			}
			else if(key=="infocenter"){//문의 및 안내	
			$("#InfocenterContent").append("<div>" + value + "</div>");
			$("#InfocenterContent").append("<br>");
			$("#InfocenterContent").append("<br>");
			$("#InfocenterContent").append("<br>");
			
			
			}
	    });
	});
	/*위치기반정보조회*/
	$.getJSON(api4,function(data){
		var myData4 = data.response.body.items.item;
		console.log(myData4);		
	});
	/*반복정보조회*/
	$.getJSON(api5,function(data){
		var myData5 = data.response.body.items.item;
		console.log("5번");
		console.log(myData5);
		
		$.each(myData5,function(key,value){
			if(key=="infotext"){
			 //정보
			$("#InfotextContent").append("<div>" + value + "</div>");
			$("#InfotextContent").append("<br>");
			$("#InfotextContent").append("<br>");
			$("#InfotextContent").append("<br>");
			
			
			}
	    });
	});
	
	

});





</script>


</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	
	<section class="ftco-section">
	
	<!-- 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
	<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="images/sample1.jpg" alt="Los Angeles">
					</div>

					<div class="item">
						<img src="images/sample2.jpg" alt="Chicago">
					</div>

					<div class="item">
						<img src="images/sample3.jpg" alt="New York">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

				<!-- 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->
	
	
		<div class="row">
	
				<div id="MainContent" class="position"></div>
                 
				<div class="container">

					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6 d-flex" id="addrContent">
								<strong>주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							</div>
							<div class="col-md-6 d-flex" id="DetailContent">
								<strong>홈페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6 d-flex" id="RestdateContent">
								<strong>휴무&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							</div>
							<div class="col-md-6 d-flex" id="UsetimeContent">
								<strong>이용시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6 d-flex" id="InfotextContent">
								<strong>정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							</div>
							<div class="col-md-6 d-flex" id="InfocenterContent">
								<strong>문의 및 안내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
							</div>
						</div>
					</div>

				</div>

			</div></section>
</body>
</html>