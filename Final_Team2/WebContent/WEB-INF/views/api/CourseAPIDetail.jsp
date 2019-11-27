<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/timeLine.css">
<title>코스 상세보기</title>
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
		
		
		var distanceData = "";
		var takeTimeData = "";
		
			apiDetail = addr + "detailInfo" + servicekey +paramArea +contentId  + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;
			apiIntro = addr + "detailIntro" + servicekey +paramArea +contentId  + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;
			apiCommon = addr + "detailCommon" + servicekey +paramArea +contentId + forCommon +"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y" + type;
			
			
			
			
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
			});
			
			
			$.getJSON(apiDetail,function(data) { 
			 var myItem = data.response.body.items.item;
			 console.log("detail");
			 console.log(data);
			 console.log(myItem)
			 
			 $(".content").append('<div id="conference-timeline">');
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
					var img = $('<img>');
					$(img).attr("class","image2");
					$(img).attr('src',element.subdetailimg);
					$(img).attr('onError',"this.images/scenery.png");
					$(img).attr('alt','여행사진');
					var imglink = $('<a>');
					$(imglink).attr('href',element.subdetailimg);
					$(imglink).attr('target','_blank');
					$(imglink).append(img);
					$(metaDate).append(imglink);
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
					$(img).attr('onError',"images/scenery.png");
					$(img).attr('alt','여행사진');
					var imglink = $('<a>');
					$(imglink).attr('href',element.subdetailimg);
					$(imglink).attr('target','_blank');
					$(imglink).append(img);
					$(metaDate).append(imglink);
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
    <div class="content">
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
</body>
</html>