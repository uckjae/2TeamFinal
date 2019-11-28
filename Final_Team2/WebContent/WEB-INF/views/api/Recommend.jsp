<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D -->
	<meta charset="UTF-8">
	<c:import url="/common/HeadTag.jsp" />
	<title>추천 여행지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		let servicekey = "63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
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
			
			apiContent = api + contentId[0].code + paramArea + areaCode[0].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#12 > #1').append("<div class='col-md-4'>"
											+"<div class='contain'>"
											+ "<a href='RecommendDetail.do?contentId="+ myData.contentid +"'><img src='"+myData.firstimage+"' alt='No Image' style='width: 100%; height: 100%;'>"
											+ "<span id='text'>" + myData.title + "</span></a></div></div>");
				//});
			});
			apiContent = api + contentId[0].code + paramArea + areaCode[1].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#12 > #2').append("<div class='col-md-4'>"
											+"<div class='contain'>"
											+ "<a href='RecommendDetail.do?contentId="+ myData.contentid +"'><img src='"+myData.firstimage+"' alt='No Image' style='width: 100%; height: 100%;'>"
											+ "<span id='text'>" + myData.title + "</span></a></div></div>");
				//});
			});
			apiContent = api + contentId[0].code + paramArea + areaCode[2].code + type;
			$.getJSON(apiContent,function(data){
				let myData = data.response.body.items.item;
				console.log(myData);
				//$.each(myData, function(index, element){
						$('#12 > #31').append("<div class='col-md-4'>"
											+"<div class='contain'>"
											+ "<a href='RecommendDetail.do?contentId="+ myData.contentid +"'><img src='"+element.firstimage+"' alt='No Image' style='width: 100%; height: 100%;'>"
											+ "<span id='text'>" + element.title + "</span></a></div></div>");
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
		<div class="row mb-4">
			<div class="col-md-9">
				<form action="#" class="search-property-1">
					<div class="row" >
						<div class="col-lg align-self-end">
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
						<div class="col-lg align-self-end">
							<div class="form-group">
								<div class="form-field col-md-4">
									<input type="submit" value="검색"
										class="form-control btn btn-primary">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>		
		</div>
		
		<!-- 검색 태그 영역 -->
		<div id="tagBox"> </div>
		
		</div>
		
		<!-- Main 화면 Top -->
		<div id="mainContentBox" class="content">
			<div id="12">
				<h2>서울</h2>
				<h4>관광지</h4>
				<div class="row" id="1" style="width: 100%; height:100%;">
					
				</div><hr>
				<h4>축제공연행사</h4>
				<div class="row" id="2"; style="width: 100%; height:100%;">
					
				</div><hr>
				<h4>여행코스</h4>
				<div class="row" id="31"; style="width: 100%; height:100%;">
					
				</div><hr>
			</div>
			
			<div id="15">
				<h1>인천</h1>
				<h3>관광지</h3>
				<div class="row" id="1" style="width: 100%; height:100%;">
					
				</div><hr>
				<h3>축제공연행사</h3>
				<div class="row" id="2"; style="width: 100%; height:100%;">
					
				</div><hr>
				<h3>여행코스</h3>
				<div class="row" id="31"; style="width: 100%; height:100%;">
					
				</div><hr>
			</div>
			
			<div id="25">
				<h1>경기</h1>
				<h3>관광지</h3>
				<div class="row" id="1" style="width: 100%; height:100%;">
					
				</div><hr>
				<h3>축제공연행사</h3>
				<div class="row" id="2"; style="width: 100%; height:100%;">
					
				</div><hr>
				<h3>여행코스</h3>
				<div class="row" id="31"; style="width: 100%; height:100%;">
					
				</div><hr>
			</div>
		</div>
		<div class="content">
			<div class="text-right" >
	 				<button type="button" class="btn btn-primary" id="new">최신순</button>
	 				<button type="button" class="btn btn-primary" id="pop">인기순</button>
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