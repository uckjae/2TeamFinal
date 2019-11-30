<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D -->
<!-- o2dopDVzLQoFs5lEezEbhHtXdV5dzsM33ApDJHV5cQwaf3b8lc3d6EQZyiar3sm8uB60h53CrvB00yqzaoNt7g%3D%3D -->
	<meta charset="UTF-8">
	<c:import url="/common/HeadTag.jsp" />
	<title>추천 여행지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		let servicekey = "o2dopDVzLQoFs5lEezEbhHtXdV5dzsM33ApDJHV5cQwaf3b8lc3d6EQZyiar3sm8uB60h53CrvB00yqzaoNt7g%3D%3D";
		$(function(){
			init();
		});
		
		function init() {
			let api ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?"
						+ "ServiceKey="+servicekey
						+ "&contentTypeId=25&&cat1=C01"
						+ "&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest"
						+ "&_type=json";
		
			$.getJSON(api, function(data){
				let tags = data.response.body.items.item;
				console.log("tag");
				console.log(tags);
				let control = "<a href='#' onclick='getData(\"all\")' id='all' class='btn btn-secondary mr-3'>#전체</a>";
				$.each(tags, function(index, element){
					control+="<a href='#' onclick='getData(\""+element.code+"\")' id='"+element.code+"' class='btn btn-primary mr-3'>#"+element.name+"</a>";
				})
				
				$("#tagBox").append(control);
				getData("all");
			});
		}
		
		let oldCode = "";
		
		let contentId = [
			{name : "관광지", code :12},
			{name : "축제공연행사", code :15},
			{name : "여행코스", code :25}
		];
		let areaCode = [
			{name : "서울", code :1},
			{name : "인천", code :2},
			{name : "경기", code :31}
		]
		function getData(code){
			console.log("코드 : " + code);
			$('#dataBox').empty();
			
			if(oldCode != "")
				$("#"+oldCode).attr("class","btn btn-primary mr-3");
			$("#"+code).attr("class","btn btn-secondary mr-3");

			let cat2="";
			if(code != "all"){ // 전체 클릭시
				cat2= code;
			//	$("#mainContentBox").css("display","none")
			}else{ // 나머지 태그 클릭시
			//	$("#mainContentBox").css("display","block")
			}
			
			let addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
			let service = "serviceKey="+servicekey;
			let paramSigungu = "&sigunguCode=";
			let paramArea = "&sigunguCode=&areaCode=";
			let paramCat = "&cat1=&cat2=&cat3=";
			let paramList = "&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B";
			let paramNumOfRows = "&numOfRows=1&pageNo=1";
			let type = "&_type=json";
			let addr2 = service + paramCat + paramList + paramSigungu + paramNumOfRows;
			let paramcontent = "&contentTypeId=";
			let api = addr + "areaBasedList?" + addr2 + paramcontent;
			let apicontent = "";
			
			/* 관광지 */
			apiContent = api + contentId[0].code + paramArea + areaCode[0].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-1 > #area1').append("<div class='col-md-4'><span>서울</span>"
								+"<div class='contain'>"
								+'		<a href="TravelDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			apiContent = api + contentId[0].code + paramArea + areaCode[1].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-1 > #area1').append("<div class='col-md-4'><span>인천</span>"
								+"<div class='contain'>"
								+'		<a href="TravelDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			apiContent = api + contentId[0].code + paramArea + areaCode[2].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-1 > #area1').append("<div class='col-md-4'><span>경기</span>"
								+"<div class='contain'>"
								+'		<a href="TravelDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			
			/* 여행축제 */
			apiContent = api + contentId[1].code + paramArea + areaCode[0].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-2 > #area2').append("<div class='col-md-4'><span>서울</span>"
								+"<div class='contain'>"
								+'		<a href="FestivalDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			apiContent = api + contentId[1].code + paramArea + areaCode[1].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-2 > #area2').append("<div class='col-md-4'><span>인천</span>"
								+"<div class='contain'>"
								+'		<a href="FestivalDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			apiContent = api + contentId[1].code + paramArea + areaCode[2].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-2 > #area2').append("<div class='col-md-4'><span>경기</span>"
								+"<div class='contain'>"
								+'		<a href="FestivalDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			
			/* 여행코스 */
			apiContent = api + contentId[2].code + paramArea + areaCode[0].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-3 > #area3').append("<div class='col-md-4'><span>서울</span>"
								+"<div class='contain'>"
								+'		<a href="CourseAPIDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			apiContent = api + contentId[2].code + paramArea + areaCode[1].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-3 > #area3').append("<div class='col-md-4'><span>인천</span>"
								+"<div class='contain'>"
								+'		<a href="CourseAPIDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			apiContent = api + contentId[2].code + paramArea + areaCode[2].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#contentId-3 > #area3').append("<div class='col-md-4'><span>경기</span>"
								+"<div class='contain'>"
								+'		<a href="CourseAPIDetail.do?contentId='+ myData.contentid +'" class="gallery img d-flex align-items-center" style="background-image: url('+myData.firstimage+');">'
								+ '			<span id="text">' + myData.title + '</span>'
								+ '		</a>'
								+ "</div></div>");
				//});
			});
			oldCode = code;
		}

	</script>
	<style type="text/css">
        html,
        body {
            height: 100%;
        }
    </style>
	<style type="text/css">
html, body {
	height: 100%;
}

.contain {
	position: relative;
	width: 100%;
	max-width: 400px;
}

.contain #text {
	background-color : white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	padding: 12px 24px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
	opacity: 0.7;
	color: black;
	width: 100%;
	font-weight: bold;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    <div class="content">
		<div class="comment-form-wrap pt-xl-2">
			
			<h1 class="text-center mb-3 bread" style="font-size: 60px;">추천 여행지</h1>
			
			<!-- <div class="col-md-9">
				<form action="#" class="search-property-1">
					<div class="row" >
						<div class="col-lg align-self-end col-md-10">
							<div class="form-group">								
								<div class="form-field">
									<div class="icon">
										<span class="ion-ios-search ml-3" style="color:black"></span>
									</div> 
									<input type="text" class="form-control"
										placeholder="   검색어를 입력하세요" name="search">										
								</div>
							</div>
						</div>
						<div class="col-lg align-self-end col-md-2">
							<div class="form-group">
								<div class="form-field col-md-4">
									<input type="submit" value="검색"
										class="form-control btn btn-primary">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>	 -->	
		</div>
		
		<!-- 검색 태그 영역 -->
		<!-- <div id="tagBox"> </div> -->
		
		</div>
		
		<!-- Main 화면 Top -->
		<div id="mainContentBox" class="content">
			<div id="contentId-1">
				<h4>관광지</h4>
				<div class="row" id="area1" style="width: 100%; height:100%;">
					
				</div><hr>
			</div>
			
			<div id="contentId-2">
				<h3>여행축제</h3>
				<div class="row" id="area2" style="width: 100%; height:100%;">
					
				</div><hr>
				
			</div>
			
			<div id="contentId-3">
				<h3>여행코스</h3>
				<div class="row" id="area3" style="width: 100%; height:100%;">
					
				</div><hr>
			</div>
		</div>
		
</body>
</html>