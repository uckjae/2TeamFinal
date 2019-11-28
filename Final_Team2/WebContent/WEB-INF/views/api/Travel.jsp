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
	var paramContentTypeId = "&contentTypeId=12"
	var ParamAreaCode = "&areaCode=2";
	var paramAppTest = "&MobileApp=AppTest&MobileOS=ETC";
	var pramArrange = "&arrange=A";
	var paramNumOfRows = "&numOfRows=10";
	var paramPageNo =  "&pageNo=";
	var pramAreaBasedList ="areaBasedList?";
	var type = "&_type=json";
	var pramList = "&listYN=Y";
	var api = "";
	
	var api = addr + pramAreaBasedList + servicekey + paramPageNo +"1" +
	          paramNumOfRows + paramAppTest + pramArrange + paramContentTypeId
	          + ParamAreaCode + pramList + type; 
		
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
								+ "<a href='TravelDetail.do?contentId="+ element.contentid+"'>" + element.title
							+"</div>"
							+"<div class='col-md-12'>"
								
							+"</div>"
						+"</div>"
					+"</div><hr>"
				);
		});
});
});


//메인 컨텐츠 만들기 
function makeRow(element){
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

     $(aTag).attr('href', 'TravelDetail.do?contentId='+ element.contentid );

     $(textSize).text(element.title);
     $(aTag).append(textSize);
     $(divText).append(aTag);

     $(divImg).append(img);
     $(divProj).append(divImg);

     $(div1).append(divProj);
     $(div1).append(divText);
     $("#apibox").append(div1);
}


let oldCode = "";
let areaCode = "";
let order = "";
let searchKey = "";
function getData(code){
   $('#apibox').empty();
   if(oldCode != "")
      $("#"+oldCode).attr("class","btn btn-primary tagclouda");
   $("#"+code).attr("class","btn btn-secondary tagclouda");

   let cat2="";
   if(code != "all"){ // 전체 클릭시
      cat2= code;
   }
   if (order == ""){
	   order = 'new';
   } 
   if (areaCode == ""){
	   areaCode = 1;
   }
   
   let paramArea = "&contentTypeId=12&areaCode=" + areaCode;
   let paramCat = "&cat1=C01&cat2="+ cat2;
   let paramList = "&cat3=&listYN=Y";
   let paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=R";
	
   let paramSearch = "&MobileOS=ETC&MobileApp=AppTest";
   let paramKeyword = "&keyword=";
   let url = encodeURI(searchKey);
   let addr2 = servicekey + paramArea + paramCat + paramList + paramArrange + paramPageNo;
   let addrSearch = addr + "searchKeyword" + url + paramKeyword + +paramSearch ;
   console.log("서치 후 인코딩 전 : "  + searchKey);
   console.log("인코딩 후 : " + url);
   var api = "";
   if(url == "") {
	   api = addr + "areaBasedList" + addr2 + type;
	   console.log("url  인 : " + api);
   } else {
	   api =   addr + "searchKeyword" + servicekey + paramKeyword + url + paramSearch ;
	   console.log("서치 한 후 api 주소 : " + api);
   }
  
   $.getJSON(api,function(data){
      let myData = data.response.body.items.item;
      if($.type(myData) === "array") {
      if (order == 'new') {
          $.each(myData, function(index, element){
        	  makeRow(element);
       });
      } else if (order == 'old') {
    	  $.each(myData.reverse(), function(index, element){
      		 makeRow(element);
        });
      } 
      } else {
    	  makeRow(myData);
      }
   }); 
   
   oldCode = code;
}

function areaSelFn () {
	 areaCode = $('#areaSel option:selected').val();
	 getData("all");
}
function orderSelFn(){
	order = $("#orderSel option:selected").val();
	getData("all");
}
function searchFn() {
	searchKey = $("#searchBar").val();
	console.log("서치 : " + searchKey);
	getData("all");
}
</script>
<style type="text/css">
html, body {
	height: 100%;
}

table {
	border: 1px;
	border-style: solid;
}

img {
	width: 150px;
	height: 113px;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	<div class="content">

		<div class="row mb-4 mt-10">
			<div class="col-md-11 offset-md-1">
				<form action="#" class="search-property-1">
					<div class="row">
						<div class="col-lg align-items-end">
							<div class="form-group">
								<label for="#"></label>
								<div class="form-field">
									<div class="select-wrap">
										<select name="orderSel" id="orderSel" class="form-control"
											onchange="orderSelFn()">
											<option value="new">최신순으로 보기</option>
											<option value="old">오래된순으로 보기</option>
										</select>
									</div>
								</div>
							</div>
						</div>


						<div class="col-md align-items-end">
							<div class="form-group">
								<label for="#"></label>
								<div class="form-field">
									<div class="select-wrap">
										<select name="areaSel" id="areaSel" class="form-control"
											onchange="areaSelFn()">
											<option value="1">서울</option>
											<option value="31">경기</option>
											<option value="2">인천</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md align-self-end">
							<div class="form-group">
								<div class="form-field">
									<input type="text" class="form-control"
										placeholder="   검색어를 입력하세요" name="searchBar" id="searchBar">
								</div>
							</div>
						</div>

						<div class="col-md align-self-end">
							<div class="form-group">
								<div class="form-field col-xl-6">
									<input type="button" value="검색"
										class="form-control btn btn-primary" onclick="searchFn()">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div id="dataBox"></div>
		<div class="pagination-sm mt-3 mb-3" style="text-align: center">
			<a href="#" class="btn btn-primary">&laquo;</a> <a href="#"
				class="btn btn-primary">1</a> <a href="#" class="btn btn-primary">2</a>
			<a href="#" class="btn btn-primary">3</a> <a href="#"
				class="btn btn-primary">4</a> <a href="#" class="btn btn-primary">5</a>
			<a href="#" class="btn btn-primary">&raquo;</a>
		</div>
	</div>

</body>
</html>
