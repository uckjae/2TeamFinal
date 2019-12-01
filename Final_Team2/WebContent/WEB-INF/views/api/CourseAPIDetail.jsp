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
<title>코스 상세보기</title>
 <style type="text/css">
        html,
        body {
            height: 100%;
        }
        
        #conference-timeline .conference-center-line {
		  position: absolute;
		  width: 3px;
		  height: 97%;
		  left: 50%;
		  margin-left: -2px;
		  background: #00b0bd;
		  z-index: -1;
		}
		
		@media only screen and (max-width: 830px) {
			#conference-timeline .conference-center-line {
    			margin-left: 0;
    			left: 50px;
 			}
		}
</style>

<script type="text/javascript">
	$(function() {
		
		// 관광정보 api 
		
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=인증키&contentTypeId=25&contentId=1952978&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y
		//detailCommon? 공통정보 //detailIntro?   소개정보 //detailInfo? 코스정보 
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		
		var servicekey = "?ServiceKey=BJSdO77vJdDgWTuBLkMbQFYP110BrRRUQay88s1EcRuNNXSTBVyUf5EwecAvQNEEzYxDSl69x5xcNSjN8IvRXA%3D%3D";
		var paramArea = "&contentTypeId=25&areaCode=1";
		var contentId = "&contentId="+${requestScope.contentId};
		var forCommon = "&defaultYN=Y&firstImageYN=Y";
		var type = "&_type=json";
		var apiDetail = "";
		var apiCommon = "";
		var apiIntro = "";
		var apiRegion = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList";
		
		var distanceData = "";
		var takeTimeData = "";
		
			apiDetail = addr + "detailInfo" + servicekey +paramArea +contentId  + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&mapinfoYN=Y" + type;
			apiIntro = addr + "detailIntro" + servicekey +paramArea +contentId  + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&mapinfoYN=Y" + type;
			apiCommon = addr + "detailCommon" + servicekey +paramArea +contentId + forCommon +"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&mapinfoYN=Y" + type;
			apiRegion += servicekey;
			
			
			
			$.getJSON(apiIntro,function(data){
				//console.log("intro");
				//console.log(data);
				distanceData = data.response.body.items.item.distance;
				takeTimeData = data.response.body.items.item.taketime;
				$("#distance").text(distanceData);
				$("#takeTime").text(takeTimeData);
				
			});
			
			$.getJSON(apiCommon,function(data){
				//console.log("common");
				//console.log(data);
				var titleData = data.response.body.items.item.title;
				//console.log(titleData);
				$("#title").text(titleData);
				//console.log(data.response.body.items.item.mapx);
				//console.log(data.response.body.items.item.mapy);
				
				//날씨api
				var rs = dfs_xy_conv("toXY",data.response.body.items.item.mapy,data.response.body.items.item.mapx);
				//console.log(rs);
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
				console.log("baseTime : " + baseTime);
				var nx = "&nx="+xValue;
				var ny = "&ny="+yValue;
				var type = "&_type=json";
				var weatherUrl = weatherApi + weatherServiceKey + baseTime + nx + ny + type;
				var jsonWeatherUrl = {"weatherUrl": weatherUrl};
				console.log("날씨 ajax시작 전");
				$.ajax({
					url: "Weather.ajax", 
					dataType: 'json',
					type:"GET",
					data: jsonWeatherUrl,
					success: function(weatherData){
						console.log("날씨 api success");
						console.log(weatherData);
						var icon = $('<i>');
						var totalRain = $('<span>');
						var degree = $('<span>');
						$.each(weatherData.response.body.items.item,function(index,element){
							if(element.category =="PTY"){
								
								if(element.obsrValue == 0){
									$(icon).attr("class","wi wi-day-sunny");
								}else{
									$(icon).attr("class","wi wi-rain");
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
					error: function(jqXHR, textStatus, errorThrown){
						console.log("날씨 ajax error");
						console.log("error"+textStatus);
					}
				});
				//날씨api END!!
				
				
				
				
				//인근지역 정보
				apiRegion += "&mapX="+data.response.body.items.item.mapx+"&mapY="+ data.response.body.items.item.mapy+"&radius=1000&listYN=Y&numOfRows=4&arrange=E&MobileOS=ETC&MobileApp=AppTest&contentTypeId=12";
				$.getJSON(apiRegion,function(arroundData){
					console.log("지역기반");
					console.log(arroundData);
					var arroundItem = arroundData.response.body.items.item
					
					var row = $('<div class="row">');
					if(arroundItem.length>1){
						$("#arroundContent").append('<h4>주변 관광지</h4>');
						$.each(arroundItem,function(index,element){
							
							var col = $('<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">');
							var pjt = $('<div class="project">');
							var imgDiv = $('<div class="img" style="max-height:105px; width:auto;">');
								var img = $('<img class="img-fluid">');
								$(img).attr("src",element.firstimage);
								$(img).attr("onError",'this.src="/images/scenery.png"');
								$(img).attr("alt","여행지사진");
							$(imgDiv).append(img);
							var txtDiv = $('<div class="text">');
								var link = $('<a>');
								$(link).attr("href","FestivalDetail.do?contentId="+arroundItem.contentid);
								var spotName = $('<h6>');
									$(spotName).text(element.title);
								$(link).append(spotName);
								$(txtDiv).append(link);
							
							$(pjt).append(imgDiv);
							$(pjt).append(txtDiv);
							$(col).append(pjt);
							$(row).append(col);
							
							
						});
						$("#arroundContent").append(row);
					}else{
						
						$("#arroundContent").append('<h4>주변 관광지</h4>');
						var col = $('<div class="col-md-12 col-lg-12 ftco-animate fadeInUp ftco-animated">');
						var pjt = $('<div class="project">');
						var imgDiv = $('<div class="img">');
							var img = $('<img class="img-fluid">');
							$(img).attr("src",arroundItem.firstimage);
							$(img).attr("onError","this.src='/images/scenery.png'");
							$(img).attr("alt","여행지사진");
						$(imgDiv).append(img);
						var txtDiv = $('<div class="text">');
							var link = $('<a>');
							$(link).attr("href","FestivalDetail.do?contentId="+arroundItem.contentid);
							var spotName = $('<h6>');
								$(spotName).text(arroundItem.title);
							$(link).append(spotName);
							$(txtDiv).append(link);
						
						$(pjt).append(imgDiv);
						$(pjt).append(txtDiv);
						$(col).append(pjt);
						$(row).append(col);
						$("#arroundContent").append(row);
					}
				});
			});
			
			
			$.getJSON(apiDetail,function(data) { 
			 var myItem = data.response.body.items.item;
			 //console.log("detail");
			 //console.log(data);
			 //console.log(myItem)
			 
			 $("#mainContent").append('<div id="conference-timeline">');
			 $("#conference-timeline").append('<div class="timeline-start">');
			 $("#conference-timeline").append('<div class="conference-center-line">');
			 $("#conference-timeline").append('<div class="conference-timeline-content">');
			 $("#conference-timeline").append('<div class="timeline-end">')
			 
			 $.each(myItem,function(index,element){
				
				if(index%2==0){
					var article = $('<div class="timeline-article">');
					var leftContainer = $('<div class="content-left-container">');
					var contentLeft = $('<div class="content-left">');
					var spanNum = $('<span class="article-number">');
					$(spanNum).text(index+1);
					$(contentLeft).append(spanNum);
					$(contentLeft).append('<p style="overflow : auto; margin-left : 2px;">'+element.subdetailoverview+'</p>');
					
					var spanAuthor = $('<span class="timeline-author">');
					$(spanAuthor).text(element.subname);
					
					var metaDate = $('<div class="meta-date">');
					var img = $('<img id="asd">');
					$(img).attr("class","image2");
					$(img).attr('src',element.subdetailimg);
					$(img).attr('onError','this.src="/images/scenery.png"');
					$(img).attr('alt','여행사진');
					var imglink = $('<a>');
					$(imglink).attr('href',element.subdetailimg);
					$(imglink).attr('target','_blank');
					$(imglink).append(img);
					$(metaDate).append(img);
					$(leftContainer).append(spanAuthor);
					$(leftContainer).append(contentLeft);
					$(leftContainer).append(metaDate);
					$(article).append(leftContainer);
					$(".conference-timeline-content").append(article);
				}else{
					var article = $('<div class="timeline-article">');
					var rightContainer = $('<div class="content-right-container">');
					var contentRight = $('<div class="content-right">');
					var spanNum = $('<span class="article-number">');
					$(spanNum).text(index+1);
					$(contentRight).append(spanNum);
					$(contentRight).append('<p style="overflow : auto; margin-left : 2px;">'+element.subdetailoverview+'</p>');
					
					var spanAuthor = $('<span class="timeline-author">');
					$(spanAuthor).text(element.subname);
					var metaDate = $('<div class="meta-date">');
					var img = $('<img>');
					$(img).attr("class","image2");
					$(img).attr('src',element.subdetailimg);
					$(img).attr('onError','this.src="/images/scenery.png"');
					$(img).attr('alt','여행사진');
					var imglink = $('<a>');
					$(imglink).attr('href',element.subdetailimg);
					$(imglink).attr('target','_blank');
					$(imglink).append(img);
					$(metaDate).append(img);
					$(rightContainer).append(spanAuthor);
					$(rightContainer).append(contentRight);
					$(rightContainer).append(metaDate);
					$(article).append(rightContainer);
					$(".conference-timeline-content").append(article);
				} 
				
				
			 });
			
		});
			
	});
</script>        
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<c:set var="currUser" value="${sessionScope.memberId }"/>
	
    <!-- Top -->
    <c:import url="/common/Top.jsp" />
    <div class="content" id="mainContent">
    		
    	<!-- 제목 -->
		<div class="row">
			<div class="col-10">
				<h1 id="title"></h1>
			</div>
			<jsp:include page="/common/MoreButton.jsp">
				<jsp:param value="false" name="useMyTravel"/>
			</jsp:include>
		</div>
		<hr>
   		<div class="row">
   			<div class="text-right">
   				<span id="distance"></span>
   				&nbsp;&nbsp;&nbsp;
   				<span id="takeTime"></span>
   			</div>
   		</div>
    </div>
    <div class="content" id="arroundContent">
    	
    </div>
   
</body>
</html>