<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<c:import url="/common/HeadTag.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/xy_convert.js"></script>
<link rel="stylesheet" href="css/timeLine.css">
<link rel="stylesheet" href="css/weather-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
.position {
	position: relative;
	margin-top: 3em;
	margin-left: 10em;
	margin-right: 10em;
}

li {
	list-style-position: inside;
	text-indent: -18px;
	padding-left: 18px;
	list-style-type: none;
}

ul {
	padding-inline-start: 0px;
}

body {
	color: black;
}
</style>
<script type="text/javascript">
	$(function() {
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		var servicekey = "serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D";
		var type = "&_type=json&";
		var paramArrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=";
		var paramNumOfRows = "&numOfRows=10";
		var paramNumOfRow = "&numOfRows=4";
		var paramPageNo = "&pageNo=1";
		var contentid = "${requestScope.contentId}";
		//공통정보조회 변수
		var paramArea = "&contentTypeId=15&areaCode=1";
		var paramSigungu = "&sigunguCode=";
		var paramCat = "&cat1=&cat2=";
		var paramList = "&cat3=&listYN=Y";
		var etc = "&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y";
		var addr2 = servicekey + paramNumOfRows + paramPageNo + paramArrange
				+ contentid;
		var apicommon = "";
		apicommon = addr + "detailCommon?" + addr2 + type + etc;

		//소개정보조회 변수
		var contentType = "&contentTypeId=15&";
		var apidetail = "";
		var addr3 = servicekey + paramNumOfRows + paramPageNo + paramArrange
				+ contentid;
		apidetail = addr + "detailIntro?" + addr3 + type + contentType;

		//이미지 조회변수
		var etc2 = "&imageYN=Y&subImageYN=Y";
		var apiimage = "";
		var addr4 = servicekey + paramNumOfRows + paramPageNo + paramArrange
				+ contentid;
		apiimage = addr + "detailImage?" + addr4 + type + etc2;

		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/
		//locationBasedList?
		//serviceKey=YgFOnPiGzVE9oRN9OFn2nqQIc7Eg260SSHWd4RD88z6cshzjM4HgcYMytNdDw1YVMSN2wIuAIsgPFa%2F9SbYQag%3D%3D
		//&numOfRows=10
		//&pageNo=1
		//&MobileOS=ETC&MobileApp=AppTest
		//&arrange=E
		//&contentTypeId=15
		//&mapX=127.1109831778
		//&mapY=37.4960925880
		//&radius=3000&listYN=Y
		
		//위치 기반 변수
		var x = "";
		var y = "";
		var xpos = "&mapX=";
		var ypos = "&mapY=";
		var image = "";
		

		//공통정보 JSON each문
		$.getJSON(apicommon, function(data) {
			var myData = data.response.body.items.item;
			
			$("#title").text(myData.title);
			
			$(".spotName").val(myData.title);

			if (window.sessionStorage) {
                sessionStorage.setItem('spotName', myData.title);
                var spotName = sessionStorage.getItem('spotName');
            }

			$.each(myData, function(key, value) {
				if (key == "overview") {
					$("#overview").append("<hr>");
					$("#overview").append("<h3><b>축제 정보</b></h3>");
					$("#overview").append("<div>" + value + "</div>");
					$("#overview").append("<hr>");
					$("#overview").append("<h3><b>상세정보</b></h3>");
					
					
				} else if (key == "homepage") {
					$(".spotLink").val(value);
					$('#url').append("<ul><li>회사 URL " + value + "</li></ul>");
					
					
				} else if (key == "mapx") {
					x = value;

				} else if (key == "mapy") {
					y = value;

				}else if(key =="firstimage2"){
					image = value;
				}
			});
				getLocation();
			
			
			getMaps();
			//이미지 정보 JSON
			$.getJSON(apiimage, function(data3) {
				var myData3 = data3.response.body.items.item;
				/* $(".mTLimage").val(image); */
				if(myData3==null){
					
					var img2 = $('<img>');
					
						$(img2).attr("src",image);
						$(".mTLimage").val(image);
					$("#imgarea").append(img2);
				}else{
				
					$.each(myData3, function(index, element) {
						var img2 = $('<img>');
					
							$(img2).attr("src",element.originimgurl);
							$(img2).attr("onError","this.src="+image);
						$("#imgarea").append(img2);
			
					});
				}
			});
			
			var rs = dfs_xy_conv("toXY",data.response.body.items.item.mapy,data.response.body.items.item.mapx);
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			if(month<10){
				month = "0" + month;
			}
			var day = date.getDate();
			if(day<10){
				day = "0" + day; 
			}
			var hour = date.getHours();
			var minutes = date.getMinutes();
			if(minutes<41){
				hour -= 1;
			}
			if(hour<10){
				hour = "0"+hour;
			}
			var xValue = rs.x;
			var yValue = rs.y;
			
			var weatherApi = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
			var weatherServiceKey = "?ServiceKey=" + "4Axvk6PyZ%2FHTR624%2B55Lt3tzBtDrMNWjR3vFCoC6bw8JgQgncE5vRstv58%2BxvNwYhj4Qh0jnrH9W2o1TwhKN0Q%3D%3D";
			var baseTime = "&base_date="+year+month+day+hour+"00";
			var nx = "&nx="+xValue;
			var ny = "&ny="+yValue;
			var type = "&_type=json";
			var weatherUrl = weatherApi + weatherServiceKey + baseTime + nx + ny + type;
			var jsonWeatherUrl = {"weatherUrl": weatherUrl};
			$.ajax({
				url: "Weather.ajax", 
				dataType: 'json',
				type:"GET",
				data: jsonWeatherUrl,
				success: function(weatherData){

					var icon = $('<i>');
					var totalRain = $('<span>');
					var degree = $('<span>');
					$.each(weatherData.response.body.items.item,function(index,element){
						if(element.category =="PTY"){
							
							if(element.obsrValue == 0){
								$(icon).attr("class","wi wi-day-sunny");
							}else{
								$(icon).attr("class","wi wi-day-rain");
							}
						}else if(element.category == "RN1"){
							$(totalRain).html("&nbsp;&nbsp;&nbsp;&nbsp;시간당 강수량 : "+ element.obsrValue +"ml");
						}else if(element.category == "T1H"){
							$(degree).html("&nbsp;&nbsp;&nbsp;&nbsp;현재기온 : " + element.obsrValue +"℃ ");
						}
					});
					$("#title").after(totalRain);
					$("#title").after(degree);
					$("#title").after(icon);
				},
				/* error: function(jqXHR, textStatus, errorThrown){
					console.log("error"+textStatus);
				} */
			});
			
			
		});
		//end

		//소개정보 JSON
		$.getJSON(apidetail, function(data2) {
			var myData2 = data2.response.body.items.item;
			
			$.each(myData2, function(key, value) {
				if (key == "eventplace") {
					$("#content").append(
							"<ul><li>주소 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;"
									+ value + "</li></ul>");
					$(".spotAddr").val(value);
				} else if (key == "eventenddate") {
					$("#info").append(
							"<ul><li>종료날짜  &nbsp;&nbsp;&nbsp;" + value
									+ "</li></ul>");
				} else if (key == "sponsor1") {
					$("#content").append(
							"<ul><li>주관   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;"
									+ value + "</li><ul>");
				} else if (key == "sponsor1tel") {
					$("#content").append(
							"<ul><li>전화번호 &nbsp;&nbsp;&nbsp;" + value
									+ "</li></ul>");
				} else if (key == "sponsor2") {
					$("#info").append(
							"<ul><li>주관 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;"
									+ value + "</li><ul>");
				} else if (key == "eventstartdate") {
					$("#content").append(
							"<ul><li>시작날짜   &nbsp;&nbsp;&nbsp;" + value
									+ "</li><ul>");
					$(".spotDate").val(value);
				} else if (key == "sponsor2tel") {
					$("#info").append(
							"<ul><li>전화번호 &nbsp;&nbsp;&nbsp;" + value
									+ "</li></ul>");
				} else if (key == "playtime") {
					$("#info").append(
							"<ul><li>시간 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;"
									+ value + "</li></ul>");
				} else if (key == "usetimefestival") {
					$("#content").append(
							"<ul><li>이용요금 &nbsp;&nbsp;&nbsp;" + value
									+ "</li><ul>");

				}

			});
			$("#content").append("<hr>");

		});

	
		//위치주변 정보조회
		function getLocation() {
			
			var arrange = "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide";
			var array = "&arrange=E";
			var range = "&radius=3000&listYN=Y";
			var apilocation = "";
			var addr5 = servicekey + paramNumOfRow + paramPageNo + arrange + array + contentType + xpos + x + ypos + y + type + range;
			apilocation = addr + "locationBasedList?" + addr5;
			var around = "";
			$.getJSON(apilocation, function(data4) {
			
				var myData4 = data4.response.body.items.item;

				$.each(myData4,function(index,element){ 
					if(element.firstimage == null){
						around = element.firstimage
					}else {
				var col = $('<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">');
					var pj = $('<div class="project">');
						var imgs = $('<div class="img" style="max-height:200px; width:auto;">');
							var itag = $('<img class="img-fluid">');
								around = element.firstimage;
									$(itag).attr("src",around);
									$(itag).attr("onError","this.src='/images/default.png'");
									$(itag).attr("alt","여행지사진");
								$(imgs).append(itag);	
								
								var txtDiv = $('<div class="text">');
								var link = $('<a>');
									$(link).attr("href","FestivalDetail.do?contentId="+element.contentid);
									var spotName = $('<h6>');
										$(spotName).text(element.title);
								$(link).append(spotName);
								$(txtDiv).append(link);
								
								$(pj).append(imgs);
								$(pj).append(txtDiv);
								$(col).append(pj);
								$("#here").append(col);
					}
				});
				
				
			});
		}

		function getMaps() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(y, x), // 지도의 중심좌표
				level : false
			// 지도의 확대 레벨
			};

			
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);

			var markerPosition = new kakao.maps.LatLng(y, x);
			
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			marker.setMap(map);
		}
		
	});

	function showTList(){
		var jsonId = {"id":"${sessionScope.memberId}"};
		$.ajax({
			type :'POST',
			url : "APIMTLFolderList",
			data: jsonId,
			dataType: "json",
			success : function (data){
				
				$("#modalIntroBtn").css("display","none");
				if($.type(data) == 'array') {
					$.each(data, function(index,element){
						$("#tlidx").val(element.tlidx);
						$("#innerModalIntro").append(
								element.name 
								+ "<input type='button' value='추가하기' class='btn btn-primary ml-3 mt-1 mb-1' onclick = 'submitFn("+element.tlidx+")'>"  
							 	+ "<br>"
						);
						
						
						//$("#innerModalIntro").append("<p><a href='#'  onclick='submitFn(element.tlidx)'>"+ element.name + "</a></p>");
						
					});
				} else {
					$("#tlidx").val(data.tlidx);
					$("#innerModalIntro").html(
							data.name 
							+ "<input type='button' value='추가하기' class='btn btn-primary ml-3 mb-3 mt-0' onclick = 'submitFn("+data.tlidx+")'>"  
						 	+ "<br>"
					);	
				} 
			},
			error:function(request, status, error){
				
	            alert("실패");
	       }
		});
		}	
	
	function submitFn(idx){
		$("#frm").attr("action","MTListContentAdd.do?tlidx="+idx);
		$("#frm").submit();
	}
</script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<c:import url="/common/Top.jsp" />
	<section class="ftco-section">
		<div class="row">
			<!-- 제목 -->
			<div class=" position" style="width: 80%; text-align: left">
				<div class="row">
					<div class="col-10">
						<h1 id="title"></h1>
					</div>
					<jsp:include page="/common/MoreButton.jsp"/>
				</div>
				<hr>
			</div>

			<center>
				<div id="imgarea" class="position">
				
				</div>
			</center>
			<div id="overview" class="position"
				style="width: 80%; text-align: left"></div>


			<div class="position" id="content"></div>
			<div class="position" id="info"></div>
			<div class="position" id="url"></div>
			<div class="position" id="map"></div>
			
			<div id="mainContentBox" class="content">
				<h4>주변축제</h4>
				<hr>
				<div class="row" id="here">
					
							
									
								</div>
						</div>
				</div>
				<div class="text-right">
				<a href="CourseAPI.do" class="btn btn-primary" style="margin-right: 150px"> 목록 </a>
				</div>
	</section>
<!--  모달창 첫 화면 -->	
<div class="modal fade" id="myTravelListModalIntro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
      
        <div class="modal-body" id="innerModalIntro">  
          <form id="frm" method="post"> 			 
			 <input  name="spotName" type="hidden" class="spotName">
			 <input  name="mTLimage" type="hidden" class="mTLimage">
			 <input  name="spotDate" type="hidden" class="spotDate">
			 <input  name="spotAddr" type="hidden" class="spotAddr">
			 <input  name="spotLink" type="hidden" class="spotLink">
		  </form>    
        </div>
        <div class="modal-footer">
        <!-- <input type="submit" class="btn btn-primary" value="여행리스트에 추가하기 ">  -->
       <button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
        </div>
       
      </div>
    </div>
  </div>	
<!-- 모달창  폴더 -->

</body>

</html>