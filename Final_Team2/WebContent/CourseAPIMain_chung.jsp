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
	 console.log("처음1");
	 init();
	 console.log("처음2");
 });
 
	function init() {
		// 관광정보 api 
		
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=인증키&contentTypeId=25&contentId=1952978&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y
		//areaBasedList? 공통정보 //detailIntro?   소개정보 //detailInfo? 코스정보 
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		var servicekey = "?ServiceKey=A8dvXKFhG%2BUeavjNpRHKFWhv%2FqmYLxNXJvSBl77Uo0%2BLcCKhKLCEa9XUq5%2ByKy%2BI%2FjTU9Jjh5o0Mgbdzo4C3CA%3D%3D";
		var paramArea = "&contentTypeId=25&areaCode=1";
		var paramCat = "&cat1=C01&cat2=";
		var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=R";
		var paramPageNo = "&numOfRows=6&pageNo=";
		var type = "&_type=json";
		var addr2 = servicekey + paramArea + paramCat + paramArrange+ paramPageNo;
		var api = "";
 	  	var contentId = "";

			api = addr + "areaBasedList" + addr2 + 1 + type;
		
			$.getJSON(api,function(data) { 
			
			 var myItem = data.response.body.items.item;
			 $.each(myItem,function(index,element){
				
	if (index < 3) {

		var div1 = $("<div class='col-md-4'>");
		var divProj = $("<div class='project mb-4'>");
		var divImg = $("<div class='image'>");
		var img = $('<img>');
		$(img).attr('src', element.firstimage);
		$(img).attr('alt', 'No Image');
		$(img).attr('style', 'width:100%');
		$(img).attr('class', 'firstImg');
		var divText = $("<div class='mb-3'>");
		var textSize = $("<h5>");
		
		var aTag = $('<a>');
		
		$(aTag).attr('href','#');
		$(aTag).attr('onclick','goCourseDetail(this.nextSibling)');
		
		var inputTag = $("<input>");
		$(inputTag).attr('type','hidden'); 
		$(inputTag).attr('name','contentid');
		$(inputTag).attr('value',element.contentid);
		
		$(textSize).text(element.title);
		$(aTag).append(textSize);
		$(divText).append(aTag);
		$(divText).append(inputTag);

		$(divImg).append(img);
		$(divProj).append(divImg);

		$(div1).append(divProj);
		$(div1).append(divText);
		$("#apiFirst").append(div1);
		


				} else {
					var div1 = $("<div class='col-md-4'>");
					var divProj = $("<div class='project mb-4'>");
					var divImg = $("<div class='image'>");
					var img = $('<img>');
					$(img).attr('src', element.firstimage);
					$(img).attr('alt', 'No Image');
					$(img).attr('style', 'width:100%');
					$(img).attr('class', 'firstImg');
					var divText = $("<div class='mb-3'>");
					var textSize = $("<h5>");
					
					var aTag = $('<a>');
					
					$(aTag).attr('href','#');
					$(aTag).attr('onclick','goCourseDetail(this.nextSibling)');
					
					var inputTag = $("<input>");
					$(inputTag).attr('type','hidden'); 
					$(inputTag).attr('name','contentid');
					$(inputTag).attr('value',element.contentid);					
					$(textSize).text(element.title);
					$(aTag).append(textSize);
					$(divText).append(aTag);
					$(divText).append(inputTag);
					$(divImg).append(img);
					$(divProj).append(divImg);
					$(div1).append(divProj);
					$(div1).append(divText);
					$("#apiSecond").append(div1);
				}
				});
			});
	}


	// 페이징 
	function pagingFn(page){
		console.log("페이지 처리 : " + page);
		
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";

		var servicekey = "?ServiceKey=A8dvXKFhG%2BUeavjNpRHKFWhv%2FqmYLxNXJvSBl77Uo0%2BLcCKhKLCEa9XUq5%2ByKy%2BI%2FjTU9Jjh5o0Mgbdzo4C3CA%3D%3D";
		var paramArea = "&contentTypeId=25&areaCode=1";
		var paramCat = "&cat1=C01&cat2=";
		var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=R";
		var paramPageNo = "&numOfRows=6&pageNo=";
		var type = "&_type=json";
		var addr2 = servicekey + paramArea + paramCat + paramArrange+ paramPageNo;
		var api = "";
 	  	var contentId = "";

			api = addr + "areaBasedList" + addr2 + page + type;
		
			$.getJSON(api,function(data) { 
			
			 var myItem = data.response.body.items.item;
			 $.each(myItem,function(index,element){
				
	if (index < 3) {

		var div1 = $("<div class='col-md-4'>");
		var divProj = $("<div class='project mb-4'>");
		var divImg = $("<div class='image'>");
		var img = $('<img>');
		$(img).attr('src', element.firstimage);
		$(img).attr('alt', 'No Image');
		$(img).attr('style', 'width:100%');
		$(img).attr('class', 'firstImg');
		var divText = $("<div class='mb-3'>");
		var textSize = $("<h5>");
		
		var aTag = $('<a>');
		
		$(aTag).attr('href','#');
		$(aTag).attr('onclick','goCourseDetail(this.nextSibling)');
		
		var inputTag = $("<input>");
		$(inputTag).attr('type','hidden'); 
		$(inputTag).attr('name','contentid');
		$(inputTag).attr('value',element.contentid);
		
		$(textSize).text(element.title);
		$(aTag).append(textSize);
		$(divText).append(aTag);
		$(divText).append(inputTag);

		$(divImg).append(img);
		$(divProj).append(divImg);

		$(div1).append(divProj);
		$(div1).append(divText);
		$("#apiFirst").append(div1);
		


				} else {
					var div1 = $("<div class='col-md-4'>");
					var divProj = $("<div class='project mb-4'>");
					var divImg = $("<div class='image'>");
					var img = $('<img>');
					$(img).attr('src', element.firstimage);
					$(img).attr('alt', 'No Image');
					$(img).attr('style', 'width:100%');
					$(img).attr('class', 'firstImg');
					var divText = $("<div class='mb-3'>");
					var textSize = $("<h5>");
					
					var aTag = $('<a>');
					
					$(aTag).attr('href','#');
					$(aTag).attr('onclick','goCourseDetail(this.nextSibling)');
					
					var inputTag = $("<input>");
					$(inputTag).attr('type','hidden'); 
					$(inputTag).attr('name','contentid');
					$(inputTag).attr('value',element.contentid);					
					$(textSize).text(element.title);
					$(aTag).append(textSize);
					$(divText).append(aTag);
					$(divText).append(inputTag);
					$(divImg).append(img);
					$(divProj).append(divImg);
					$(div1).append(divProj);
					$(div1).append(divText);
					$("#apiSecond").append(div1);
				}
				});
			});
	}

	
	function goCourseDetail(own){
		console.log($(own).val());
		request.setAttribute("contentId", $(own).val());
		location.href("courseAPIDetail.do");
	}
	function pageChange(number){
		var page = $(number).text()
	//	api = addr + "areaBasedList" + addr2 + page + type;
		console.log(page);
		pagingFn(page);
	}
</script>    
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
	<div class="content">
	
		<div class="row mb-4 mt-10">
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
		
		<a href="#" class = "btn btn-primary mr-3">#전체</a>		
		<a href="#" class = "btn btn-primary mr-3">#가족 코스</a>
		<a href="#" class = "btn btn-primary mr-3">#나홀로 코스</a>
		<a href="#" class = "btn btn-primary mr-3">#힐링코스</a>
		<a href="#" class = "btn btn-primary mr-3">#도보코스</a>
		<a href="#" class = "btn btn-primary mr-3">#캠핑코스</a>
		<a href="#" class = "btn btn-primary mr-3">#맛코스</a>
		</div>
	<div class="container mt-5">
		<div class="row" id="apiFirst">
			
		</div>
		<div class="row"  id="apiSecond">
<%-- <c:set  value=/> --%>
		</div>
		             <div class="row mt-5 mb-4">
                        <div class="col text-center">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#" onclick = "pageChange(this)">&lt;</a></li>
                                    <li class="active"><a href="#" onclick = "pageChange(this)">1</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">2</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">3</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">4</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">5</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
	</div>


</body>
</html>