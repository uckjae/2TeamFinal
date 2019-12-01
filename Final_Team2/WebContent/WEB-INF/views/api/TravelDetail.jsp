<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	/*공통정보*/
	var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
	var servicekey = "serviceKey=ckJdBLYy4BEBjKn2aXypvENewx09cAsw8TX96K6Ck%2BCnpp7C8GNon1%2FIvuVRGU4XX8U4dcQxppyEf1pt52NXZA%3D%3D";
	var AppTest = "&MobileOS=ETC&MobileApp=AppTest";
	var contentTypeId = "&contentTypeId=12";
	var pramContentId = "&contentId=";
	var contentid = "${requestScope.contentId}";
	/*Json*/
	var numOfRows = "&numOfRows=10";
	var numOfRows2 = "&numOfRows=1";
	var numOfRows4 = "&numOfRows=4";
	var pageNo = "&pageNo=1";
	var areaCode = "&areaCode=";
	var Sigungu = "&sigunguCode=";
	var type = "&_type=json";
	var type2 = "&_type=json&";
	/*서비스*/
	var pramDetailImage = "detailImage?";
	var pramDetailCommon = "detailCommon?";
	var pramDetailIntro = "detailIntro?";
	var pramLocationBasedList = "locationBasedList?";
	var pramDetailInfo = "detailInfo?";
	/*기타*/
	var etc2 = "&imageYN=Y&subImageYN=Y";
	var pramSubImage = "&cat1=&cat2=&cat3=&listYN=Y";
	var pramImage = "&imageYN=Y";
	var pramSubImage = "&subImageYN=Y";
	var pramOverView = "&overviewYN=Y";
	var pramMapInfo = "&mapinfoYN=Y";
	var pramAddrInfo = "&addrinfoYN=Y";
	var pramCatCode = "&catcodeYN=Y";
	var pramDefault = "&defaultYN=Y";
	var pramFirstImage = "&firstImageYN=Y";
	var pramAreaCode = "&areacodeYN=Y";
	var pramArrrange = "&arrange=";
	var pramMapX = "&mapX=";
	var pramMapY = "&mapY=";
	var pramRadius = "&radius=3000";
	var pramListYN = "&listYN=Y";
	var pramrange = "&radius=3000";
	var loArray = "&arrange=E";
	/*변수*/
	var api = "";
	var api2 = "";
	var api3 = "";
	var api4 = "";
	var api5 = "";
	var api6 = "";
	var x = "";
	var y = "";
	var apilocation = "";
	var apiCommon = "";
	var api = addr + pramDetailImage + servicekey + numOfRows + pageNo /*이미지조회*/
			+ AppTest + pramContentId + contentid + type2 + etc2;
	
	var api2 = addr + pramDetailCommon + servicekey + numOfRows + pageNo /*공통조회*/
			+ AppTest + pramContentId + contentid + contentTypeId
			+ pramDefault + pramFirstImage + pramAreaCode + pramCatCode
			+ pramAddrInfo + pramMapInfo + pramOverView + type;

	var api3 = addr + pramDetailIntro + servicekey + numOfRows + pageNo /*상세조회1*/
			+ AppTest + pramContentId + contentid + contentTypeId + type;

	var api4 = addr + pramDetailInfo + servicekey + numOfRows2 + pageNo /*상세조회2*/
			+ AppTest + pramContentId + contentid + contentTypeId + type;
		/* 공통정보조회 -상세*/
	$.getJSON(api2,function(data) {
   			var myData2 = data.response.body.items.item;
			$.each(myData2, function(key, value) {
				if (key == "title") {
					$("#title").append("<div>" + value + "</div>");
				}else if (key == "overview") {
					$("#MainContent").append("<div>" + value + "</div>");
				}else if (key == "addr1") { //주소	 
					$("#addrContent").append("<div>" + value + "</div>");
					$("#addrContent").append("<br>");
					$("#addrContent").append("<br>");
					$("#addrContent").append("<br>");
					$("#addrContent").append("<br>");
				}else if (key == "homepage") { //홈페이지
					$("#DetailContent").append("<div>" + value + "</div>");
					$("#DetailContent").append("<br>");
					$("#DetailContent").append("<br>");
					$("#DetailContent").append("<br>");
				}else if (key == "mapx") {
					x = value;
				}else if (key == "mapy") {
					y = value;
				}
				getMaps();
			});
			getLocation();
			$.getJSON(api, function(data) {
				var myData = data.response.body.items.item;
				if (myData == null) {
					var img2 = $('<img>');
					$(img2).attr("src", image);
					$("#imgarea").append(img2);
				}else {
					$.each(myData, function(index, element) {
						var img2 = $('<img>');
						$(img2).attr("src", element.originimgurl);
						$("#imgarea").append(img2);
					});
				}
			});
			//날씨api
			var rs = dfs_xy_conv("toXY", data.response.body.items.item.mapy, data.response.body.items.item.mapx);
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
			if (minutes < 41) {
				hour -= 1;
			}
			if (hour < 10) {
				hour = "0" + hour;
			}
			var xValue = rs.x;
			var yValue = rs.y;
			var weatherApi = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
			var weatherServiceKey = "?ServiceKey="
					+ "4Axvk6PyZ%2FHTR624%2B55Lt3tzBtDrMNWjR3vFCoC6bw8JgQgncE5vRstv58%2BxvNwYhj4Qh0jnrH9W2o1TwhKN0Q%3D%3D";
			var baseTime = "&base_date=" + year + month + day + hour + "00";
			var nx = "&nx=" + xValue;
			var ny = "&ny=" + yValue;
			var type = "&_type=json";
			var weatherUrl = weatherApi + weatherServiceKey + baseTime + nx + ny + type;
			var jsonWeatherUrl = { "weatherUrl" : weatherUrl };
			$.ajax({
					url : "Weather.ajax",
					dataType : 'json',
					type : "GET",
					data : jsonWeatherUrl,
					success : function(weatherData) {
						var icon = $('<i>');
						var totalRain = $('<span>');
						var degree = $('<span>');
							$.each(weatherData.response.body.items.item,function(index,element) {
										if (element.category == "PTY") {
											if (element.obsrValue == 0) {
												$(icon).attr("class","wi wi-day-sunny");
													}else if {
														$(icon).attr("class","wi wi-day-rain");
													}
												}else if (element.category == "RN1") {
													$(totalRain).html("&nbsp;&nbsp;&nbsp;&nbsp;시간당 강수량 : "+ element.obsrValue+ "ml");
												}else if (element.category == "T1H") {
													$(degree).html("&nbsp;&nbsp;&nbsp;&nbsp;현재기온 : "+ element.obsrValue+ "℃ ");
												}
											});
							$("#title").after(totalRain);
							$("#title").after(degree);
							$("#title").after(icon);
						},
					});//날씨api END!!
		});
		/* 상세정보조회 -상세 */
		$.getJSON(api3, function(data) {
			var myData3 = data.response.body.items.item;
			$.each(myData3, function(key, value) {
				if (key == "restdate") { //휴무
					$("#RestdateContent").append("<div>" + value + "</div>");
					$("#RestdateContent").append("<br>");
					$("#RestdateContent").append("<br>");
					$("#RestdateContent").append("<br>");
				} else if (key == "usetime") {//이용시간			
					$("#UsetimeContent").append("<div>" + value + "</div>");
					$("#UsetimeContent").append("<br>");
					$("#UsetimeContent").append("<br>");
					$("#UsetimeContent").append("<br>");
				} else if (key == "infocenter") {//문의 및 안내	
					$("#InfocenterContent").append("<div>" + value + "</div>");
					$("#InfocenterContent").append("<br>");
					$("#InfocenterContent").append("<br>");
					$("#InfocenterContent").append("<br>");
				}
			});
		});
		$.getJSON(api4, function(data) {/* 반복정보조회 -상세 */
			var myData4 = data.response.body.items.item;
			$.each(myData4, function(key, value) {
				if (key == "infotext") {//정보
					$("#InfotextContent").append("<div>" + value + "</div>");
					$("#InfotextContent").append("<br>");
					$("#InfotextContent").append("<br>");
					$("#InfotextContent").append("<br>");
				}
			});
		});
		function getLocation() {//위치주변 정보조회
			var range3000 = "&radius=3000&listYN=Y";
			var apilocation = "";
			var apilocation = addr + pramLocationBasedList + servicekey
					+ numOfRows4 + pageNo + AppTest + loArray + contentTypeId
					+ pramMapX + x + pramMapY + y + type2 + range3000;
			var around = "";
			$.getJSON(apilocation,
						function(data7) {
								var myData7 = data7.response.body.items.item;
								$.each(myData7,function(index, element) {
												var col = $('<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">');
												var pj = $('<div class="project">');
												var imgs = $('<div class="img" style="max-height:200px; width:auto;">');
												var itag = $('<img class="img-fluid">');
												around = element.firstimage;
												$(itag).attr("src", around);
												$(itag).attr("onError","this.src='/images/default.png'");
													$(itag).attr("alt","여행지사진");
													$(imgs).append(itag);
													var txtDiv = $('<div class="text">');
													var link = $('<a>');
													$(link).attr("href","TravelDetail.do?contentId="+ element.contentid);
													var spotName = $('<h6>');
													$(spotName).text(element.title);
													$(link).append(spotName);
													$(txtDiv).append(link);
													$(pj).append(imgs);
													$(pj).append(txtDiv);
													$(col).append(pj);
													$("#here").append(col);
												});
							});
		}
		function getMaps() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(y, x), // 지도의 중심좌표
				level : 2// 지도의 확대 레벨
			};
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var markerPosition = new kakao.maps.LatLng(y, x);
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});
			marker.setMap(map);
		}
		$("#kakaoLink").click(function(){
		})
	});
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	<section class="ftco-section">
		<div class="row">
<!-- 제목 --><div class=" position" style="width: 80%; text-align: left">
				<div class="row">
					<div class="col-10"><h1 id="title"></h1></div>
					<jsp:include page="/common/MoreButton.jsp" />
				</div>
				<hr>
			</div>

			<div class="container">
				<center><div class="container" id="imgarea"></div></center>
			</div>
			<!-- 여행정보 -->
			<div class="container"><br><br><hr><h1>여행정보</h1><br><br>
			</div>
			<div id="MainContent" class="container"></div>

			<div class="container">
				<div class="container"><br><br><hr><h1>상세정보</h1><br><br></div>
				
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6 d-flex" id="addrContent">
							<strong>주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
						<div class="col-md-6 d-flex" id="DetailContent">
							<strong>홈페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6 d-flex" id="RestdateContent">
							<strong>휴무&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
						<div class="col-md-6 d-flex" id="UsetimeContent">
							<strong>이용시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6 d-flex" id="InfotextContent">
							<strong>정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
						<div class="col-md-6 d-flex" id="InfocenterContent">
							<strong>문의 및 안내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
					</div>
				</div>
			</div>
			<div class="container"><br><br><hr><h1>여행지 지도</h1><br><br></div>
			<div class="container" id="map"></div>
		</div>

		<div id="mainContentBox" class="content"><br><br><hr><h1>주변 여행지(3Km)</h1><br><br>
			<div class="row" id="here"></div>
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
				<form id="frm" method="post">
					<div class="modal-body" id="innerModalIntro"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="modalIntroBtn" onclick="showTList()" value="목록보기">목록보기</button>
						<button id="deletebtn" class="btn btn-secondary" type="button"data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 모달창  폴더 -->
	<div class="modal fade" id="myTravelListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form id="frm" method="post">
					<div class="modal-body" id="innerModal">
						<c:set var="mTFolderList" value="${requestScope.mTList}"/>
						<table class="table">
							<tr>
								<th class="pl-5">NO</th>
								<th>폴더 리스트</th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach var="mTFolder" items="${ mTFolderList}" varStatus="status">
								<tr>
									<td class="pl-5">${status.count}</td>
									<td><a href="MTList.do?tLidx=${mTFolder.tLidx}">${ mTFolder.tLName}</a></td>
									<td><a href="#" id="editbtn" class="btn btn-primary"
										data-toggle="modal" data-target="#editModal1" data-cmd="edit"
										data-edit-tlidx="${mTFolder.tLidx}"
										data-edit-tlname="${mTFolder.tLName}">수정 </a></td>
									<td><a href="MTFolderListDelete.do?tLidx=${mTFolder.tLidx}" class="btn btn-secondary"> 삭제 </a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" id="modalBtn">
						<button id="deletebtn" class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="text-right">
				<a href="Travel.do" class="btn btn-primary" style="margin-right: 150px"> 목록 </a>
				</div>
</body>
</html>