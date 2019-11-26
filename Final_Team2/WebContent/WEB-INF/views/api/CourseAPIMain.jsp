<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>코스 </title>
 <style type="text/css">
        html,
        body {
            height: 100%;
        }
    </style>
<script type="text/javascript">
	$(function() {
		// 관광정보 api 
		
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=인증키&contentTypeId=25&contentId=1952978&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y
		//areaBasedList? 공통정보 //detailIntro?   소개정보 //detailInfo? 코스정보 
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";

		var servicekey = "?ServiceKey=A8dvXKFhG%2BUeavjNpRHKFWhv%2FqmYLxNXJvSBl77Uo0%2BLcCKhKLCEa9XUq5%2ByKy%2BI%2FjTU9Jjh5o0Mgbdzo4C3CA%3D%3D";
		var paramArea = "&contentTypeId=25&areaCode=1";
		var paramSigungu = "&sigunguCode=";
		var paramCat = "&cat1=C01&cat2=";
		var paramList = "&cat3=&listYN=Y";
		var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=D";
		var paramNumOfRows = "&numOfRows=6";
		var paramPageNo =  "&pageNo=";
		var type = "&_type=json";
		var addr2 = servicekey + paramArea + paramSigungu + paramCat + paramList + paramArrange+ paramNumOfRows + paramPageNo;
		var api = "";
 	  
	//	for(var i = 1; i<4; i++){
			api = addr + "areaBasedList" + addr2 + "1" + type;
		
			$.getJSON(api,function(data) { 
			 var myItem = data.response.body.items.item;
			 $.each(myItem,function(index,element){
				 console.log("each문 " + index);
			//	$(".content").append( "<img src ='"+ element.firstimage + "' alt='No image'/>");
			//	$(".content").append( "<h3>"+element.title +" </h3>");				
			 });
			
		});
	//	}	
	
	});
</script>    
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />

	<div class="content">
		<div class="row">
			<div class="col-md-9">
				<form action="#" class="search-property-1">
					<div class="row">
						<div class="col-lg align-items-end">
							<div class="form-group">								
								<div class="form-field">
									<div class="icon">
										<span class="ion-ios-search" style="color:black"></span>
									</div>
									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요" name="search">
										
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
	</div>


	<!--  
	<div class="content">
    -->


    
</body>
</html>