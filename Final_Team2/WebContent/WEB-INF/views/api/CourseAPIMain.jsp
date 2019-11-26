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
				 if(index == 0 || index == 3) {
					/* $("#apiContent").append("<tr>"); 
					$("#apiContent").append( "<td><img src ='"+element.firstimage + "' alt='No image' class='col-lg-4'/></td>");
					$("#apiContent").append( "<td><h3>"+index+ element.title +" </h3></td>");
					$("#apiContent").append("</tr>");  */
					
					$("#apiContent").append("<tr>"
												+"<td><img src ='"+element.firstimage + "' alt='No image' class='col-lg-4'/></td>"+
												+"<td><h3>"+index+ element.title +" </h3></td>"
											+"</tr>"); 
					
				 }else {
					
				    /* $("#apiContent").append( "<td><img src ='"+ element.firstimage + "' alt='No image'/></td>");
					$("#apiContent").append( "<td><h3>"+index+ element.title +" </h3></td>"); */
					
					$("#apiContent").append( "<td>"+
												"<img src ='"+ element.firstimage + "' alt='No image'/>"+
												"</td><td><h3>"+index+ element.title +" </h3></td>");
					
				 }			
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
		<div class="row mb-3">
			<div class="col-md-9">
				<form action="#" class="search-property-1">
					<div class="row">
						<div class="col-lg align-items-end">
							<div class="form-group">
								<label for="#"></label>
								<div class="form-field">
									<div class="select-wrap">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control">
										    <option value="">--지역을 선택하세요--</option>
											<option value="">서울</option>
											<option value="">경기</option>
											<option value="">인천</option>
										</select>
									</div>
								</div>
							</div>
						</div>

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
				
		<a href="#" class = "btn btn-primary mr-3">#가족 코스</a>
		<a href="#" class = "btn btn-primary mr-3">#나홀로 코스</a>
		<a href="#" class = "btn btn-primary mr-3">#힐링코스</a>
		<a href="#" class = "btn btn-primary mr-3">#도보코스</a>
		<a href="#" class = "btn btn-primary mr-3">#캠핑코스</a>
		<a href="#" class = "btn btn-primary mr-3">#맛코스</a>
		</div>
	<div class="content">
		<table id="apiContent">

		</table>
	</div>
 
</body>
</html>