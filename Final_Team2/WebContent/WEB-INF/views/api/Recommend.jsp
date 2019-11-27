<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D -->
	<meta charset="UTF-8">
	<c:import url="/common/HeadTag.jsp" />
	<title>코스</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
		/* http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList
		?ServiceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D
				&contentTypeId=25&areaCode=&sigunguCode=&cat1=C01&cat2=&cat3=
					&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=12&pageNo=1&_type=json */
			var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
			var servicekey = "serviceKey=63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
			var paramArea = "&contentTypeId=25&areaCode=1";
			var paramSigungu = "&sigunguCode=";
			var paramCat = "&cat1=C01&cat2=";
			var paramList = "&cat3=&listYN=Y";
			var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B";
			var paramNumOfRows = "&numOfRows=6";
			var paramPageNo =  "&pageNo=";
			var type = "&_type=json";
			var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
			var api = "";
		
			api = addr + "areaBasedList?" + addr2 + "1" + type;
			
			$.getJSON(api,function(data){
				var myData = data.response.body.items.item;
				console.log(myData);
				$.each(myData, function(index, element){
					$('#apiFirst').append(
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
		});
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
		<a href="#" class = "btn btn-primary mr-3">#전체</a>		
		<a href="#" class = "btn btn-primary mr-3">#가족 코스</a>
		<a href="#" class = "btn btn-primary mr-3">#나홀로 코스</a>
		<a href="#" class = "btn btn-primary mr-3">#힐링코스</a>
		<a href="#" class = "btn btn-primary mr-3">#도보코스</a>
		<a href="#" class = "btn btn-primary mr-3">#캠핑코스</a>
		<a href="#" class = "btn btn-primary mr-3">#맛코스</a>
		</div>
	<div class="content">
		<!-- <div class="row" id="apiFirst"> -->
			<div class="container" id="apiFirst">
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