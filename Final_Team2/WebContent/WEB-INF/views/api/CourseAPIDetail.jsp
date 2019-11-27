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
<title>코스 상세보기</title>
 <style type="text/css">
        html,
        body {
            height: 100%;
        }
        
        .scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  
  transform: scale(5);
  -webkit-transform: scale(5);
  -moz-transform: scale(5);
  -ms-transform: scale(5);
  -o-transform: scale(5);
  -position: fixed;

}


</style>

<script type="text/javascript">
	$(function() {
		
		// 관광정보 api 
		
		//http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=인증키&contentTypeId=25&contentId=1952978&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y
		//detailCommon? 공통정보 //detailIntro?   소개정보 //detailInfo? 코스정보 
		var addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
		
		var servicekey = "?ServiceKey=A8dvXKFhG%2BUeavjNpRHKFWhv%2FqmYLxNXJvSBl77Uo0%2BLcCKhKLCEa9XUq5%2ByKy%2BI%2FjTU9Jjh5o0Mgbdzo4C3CA%3D%3D";
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
				console.log("intro");
				console.log(data);
				distanceData = data.response.body.items.item.distance;
				takeTimeData = data.response.body.items.item.taketime;
				$("#distance").text(distanceData);
				$("#takeTime").text(takeTimeData);
				
			});
			
			$.getJSON(apiCommon,function(data){
				console.log("common");
				console.log(data);
				var titleData = data.response.body.items.item.title;
				//console.log(titleData);
				$("#title").text(titleData);
				
				//날씨api
				var rs = dfs_xy_conv(data.response.body.items.item.mapy,data.response.body.items.item.mapx);
				console.log(rs);
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth()+1;
				var day = date.getDate();
				var hour = date.getHours();
				var minutes = date.getMinutes();
				if(minutes<41){
					hour -= 1;
				}
				var x = rs.lat;
				var y = rs.lng;
				console.log("x"+x);
				console.log("y"+y);
				
				var weatherApi = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
				var weatherServiceKey = "?ServiceKey=" + "4Axvk6PyZ%2FHTR624%2B55Lt3tzBtDrMNWjR3vFCoC6bw8JgQgncE5vRstv58%2BxvNwYhj4Qh0jnrH9W2o1TwhKN0Q%3D%3D";
				var baseTime = "&base_date="+year+month+day+hour+"00";
				var nx = "&nx="+x;
				var ny = "&ny="+y;
				var type = "&_type=json";
				var weatherUrl = weatherApi + weatherServiceKey + baseTime + nx + ny + type;
				console.log("날씨!!"+weatherUrl);
				
				
				//인근지역 정보
				apiRegion += "&mapX="+data.response.body.items.item.mapx+"&mapY="+ data.response.body.items.item.mapy+"&radius=1000&listYN=Y&numOfRows=4&arrange=E&MobileOS=ETC&MobileApp=AppTest&contentTypeId=12";
				$.getJSON(apiRegion,function(arroundData){
					console.log("지역기반");
					console.log(arroundData);
					var arroundItem = arroundData.response.body.items.item
					
					var row = $('<div class="row">');
					$.each(arroundItem,function(index,element){
						var col = $('<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">');
						var pjt = $('<div class="project">');
						var imgDiv = $('<div class="img" style="max-height:105px; width:auto;">');
							var img = $('<img class="img-fluid">');
							$(img).attr("src",element.firstimage);
							$(img).attr("onError","this.src='images/scenery.png'");
							$(img).attr("alt","여행지사진");
						$(imgDiv).append(img);
						var txtDiv = $('<div class="text">');
							var spotName = $('<h6>');
								$(spotName).text(element.title);
							$(txtDiv).append(spotName);
						
						$(pjt).append(imgDiv);
						$(pjt).append(txtDiv);
						$(col).append(pjt);
						$(row).append(col);
						
					});
					$("#arroundContent").append(row);
				});
			});
			
			
			$.getJSON(apiDetail,function(data) { 
			 var myItem = data.response.body.items.item;
			 console.log("detail");
			 console.log(data);
			 console.log(myItem)
			 
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
					$(img).attr("class","image2 scale");
					$(img).attr('src',element.subdetailimg);
					$(img).attr('onError',"this.images/scenery.png");
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
					$(img).attr("class","image2 scale");
					$(img).attr('src',element.subdetailimg);
					$(img).attr('onError',"images/scenery.png");
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
    	<div class="row">
   			<h1 class="text-center" id="title"></h1>
    	</div>
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