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
        
        .tagcloud .tagclouda {
         font-size: 14px;
          margin-right: 1rem;
        }
    </style>
<script type="text/javascript">
let addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
let servicekey = "?ServiceKey=A8dvXKFhG%2BUeavjNpRHKFWhv%2FqmYLxNXJvSBl77Uo0%2BLcCKhKLCEa9XUq5%2ByKy%2BI%2FjTU9Jjh5o0Mgbdzo4C3CA%3D%3D";
let paramPageNo = "&numOfRows=147&pageNo=1";
let type = "&_type=json";

$(function () {
    init();
});

function init() {
    //http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=인증키&contentTypeId=25&contentId=1952978&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y
    //areaBasedList? 공통정보 //detailIntro?   소개정보 //detailInfo? 코스정보 
    			let api ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode"
						+ servicekey
						+ "&contentTypeId=25&cat1=C01"
						+ "&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=AppTest"
						+ "&_type=json";

    $.getJSON(api, function (data) {

        var myItem = data.response.body.items.item;
        let control = "<a href='#' onclick='getData(\"all\")' id='all' class='tagclouda btn btn-secondary'>#전체</a>";
        
        $.each(myItem, function(index, element){
			control+="<a href='#' onclick='getData(\""+ element.code +"\")' id='"+ element.code +"' class='tagclouda btn btn-primary'>#"+element.name+"</a>";
        })

		$("#tagBox").append(control);
        
		getData("all");
    });
}

// 메인 컨텐츠 만들기 
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

     $(aTag).attr('href', 'CourseAPIDetail.do?contentId='+ element.contentid );

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
   
   let paramArea = "&contentTypeId=25&areaCode=" + areaCode;
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
      if (order == 'new') {
          $.each(myData, function(index, element){
     		 makeRow(element);
       });
      } else if (order == 'old') {
    	  $.each(myData.reverse(), function(index, element){
      		 makeRow(element);
        });
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
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

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
                                        <select name="orderSel" id="orderSel" class="form-control" onchange="orderSelFn()">
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
										<select name="areaSel" id="areaSel" class="form-control" onchange="areaSelFn()">
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

		<div class="col-md-10 offset-md-2 tagcloud" id="tagBox"></div>
		<div class="container mt-5" id="contentBox">
			<div class="row" id="apibox"></div>
		</div>
		<!-- 		             <div class="row mt-5 mb-4">
                        <div class="col text-center">
                            <div class="block-27">
                                <ul class="pageul">
                                    <li><a href="#" onclick = "pageChange(this)">&lt;</a></li>
                                    <li class="active"><a href="#" onclick = "pageChange(this)">1</a>               
                                    <li><a href="#" onclick = "pageChange(this)">2</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">3</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">4</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">5</a></li>
                                    <li><a href="#" onclick = "pageChange(this)">&gt;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div> -->
	</div>


</body>
</html>