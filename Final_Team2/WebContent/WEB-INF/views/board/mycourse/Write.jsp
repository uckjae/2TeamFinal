<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- https://codepen.io/uckjae/pen/WNNmMEO (타임라인 참조사이트링크) -->
	<c:import url="/common/HeadTag.jsp" />
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/timeLine.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="js/timeline.js"></script>
<title>나만의 코스 작성</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
	
	<!-- Vertical Timeline -->
	<div class="content">
  	<div id="conference-timeline">
    <div class="timeline-start"><i id="removeSpot"><span class="icon-minus"></span></i>&nbsp;&nbsp;Start&nbsp;&nbsp;<a id="addSpot"><span  class="icon-plus"></span></a></div>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <form id="inputForm" action="" enctype="multipart/form-data">
      <div class="timeline-article">
        <div class="content-left-container">
            <textarea name="content" form="inform" cols="40" rows="5"></textarea>
             <span class="article-number">01</span>
          <input type="file" id="photo" name="photo" accept="image/*">
          <input type="text" name="spot" placeholder="관광지 이름" style="float: right; text-align: center;">
        </div>
        
        <div class="meta-date">
			<img src="" alt="여행지 사진">
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      <div class="content timeline-article">
        
        <div class="content-right-container">
          <textarea name="content" form="inform" cols="40" rows="5"></textarea>
             <span class="article-number">02</span>
          <input type="file" id="photo" name="photo" accept="image/*">
          <input type="text" name="spot" placeholder="관광지 이름" style="float: right; text-align: center;">
        </div>
        <div class="meta-date">
          <img alt="여행지 사진" src="">
        </div>
      </div>
      <!-- // Article -->
    </form>  
    
      <!-- // Article -->
    </div>
    <div class="timeline-end">End</div>
  </div>
  </div>
  <!-- // Vertical Timeline -->
  
</body>
</html>