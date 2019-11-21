<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/common/HeadTag.jsp" />
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/timeLine.css">
	
<title>Insert title here</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
	
	<!-- Vertical Timeline -->
	<div class="content">
  	<div id="conference-timeline">
    <div class="timeline-start"><span onclick="" class="icon-minus"></span>&nbsp;&nbsp;Start&nbsp;&nbsp;<span onclick="" class="icon-plus"></span></div>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <form action="" enctype="multipart/form-data">
      <div class="timeline-article">
        <div class="content-left-container">
            <textarea name="content" form="inform" cols="40" rows="5"></textarea>
             <span class="article-number">01</span>
          <input type="file" id="photo" name="photo" accept="image/*">
          <input type="text" placeholder="관광지 이름" style="float: right; text-align: center;">
        </div>
        
        <div class="meta-date">
			<img src="" alt="여행지 사진">
        </div>
      </div>
      <!-- // Article -->
      
      <!-- Article -->
      <div class="content timeline-article">
        
        <div class="content-right-container">
          <div class="content-right">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. <span class="article-number">02</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
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