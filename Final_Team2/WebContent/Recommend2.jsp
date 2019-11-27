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
		let servicekey = "63HZEzzQ3RIwBc9B%2FQsElWfkL%2Fnzn0m0IgVFIMFruudG7cwoL3kx6Dpk0W%2FpHGGTIWVUL3EKsRFhDD%2ForaA0kA%3D%3D";
		$(function(){
			getTag();
		});
		
		function getTag() {
			let api ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?"
						+ "ServiceKey="+servicekey
						+ "&contentTypeId=25&&cat1=C01"
						+ "&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest"
						+ "&_type=json";
			
			$.getJSON(api, function(data){
				let tags = data.response.body.items.item;
				let control = "<a href='#' class='btn btn-primary mr-3'>#전체</a>";
				$.each(tags, function(index, element){
					control+="<a href='어쩌구.do?code="+element.code+"' class='btn btn-primary mr-3'>#"+element.name+"</a>";
				})
				
				console.log(control);
				$("#tagBox").append(control);
			});
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
		<div id="tagBox">
		</div>
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