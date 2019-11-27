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
		function getData(code){
			$('#dataBox').empty();
			
			if(oldCode != "")
				$("#"+oldCode).attr("class","btn btn-primary mr-3");
			$("#"+code).attr("class","btn btn-secondary mr-3");

			let cat2="";
			if(code != "all"){ // 전체 클릭시
				cat2= code;
				$("#mainContentBox").css("display","none")
			}else{ // 나머지 태그 클릭시
				$("#mainContentBox").css("display","block")
			}
			
			let addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
			let service = "serviceKey="+servicekey;
			let paramArea = "&contentTypeId=25&areaCode=1";
			let paramSigungu = "&sigunguCode=";
			let paramCat = "&cat1=C01&cat2="+cat2;
			let paramList = "&cat3=&listYN=Y";
			let paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B";
			let paramNumOfRows = "&numOfRows=1000";
			let paramPageNo =  "&pageNo=1";
			let type = "&_type=json";
			let addr2 = service + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
			let api = addr + "areaBasedList?" + addr2 + type;
			console.log(api);
			$.getJSON(api,function(data){
				let myData = data.response.body.items.item;
				$.each(myData, function(index, element){
					$('#dataBox').append(
						"<div class='row'>"
							+"<div class='col-md-3'>"
								+"<img src='"+ element.firstimage +"' alt='" + element.firstimage2 + "' style='width:100%'>"
							+"</div>"
							+"<div class='col-md-9'>"
								+"<div class='col-md-12'>"
									+ "<a href='RecommendDetail.do'>" + element.title
								+"</div>"
								+"<div class='col-md-12'>"
									
								+"</div>"
							+"</div>"
						+"</div><hr>"
					);
				});
				
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
			<div class="row">
				<div class="col-md-4">1</div>
				<div class="col-md-4">2</div>
				<div class="col-md-4">3</div>
			</div>
		</div>
	<div class="content">
		<!-- <div class="row" id="apiFirst"> -->
			<div class="container" id="dataBox">
 				<button type="button" class="btn btn-primary" id="new">최신순</button>
 				<button type="button" class="btn btn-primary" id="pop">인기순</button>
			</div>
		<!-- </div> -->
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