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
    <div class="timeline-start">Start</div>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <form action="" enctype="multipart/form-data">
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <input type="text" id="content" name="content">
             <span class="article-number">01</span>
          </div>
          <input type="file" id="photo" name="photo" accept="image/*">
          <span class="timeline-author">John Doe</span>
        </div>
        
        <div class="meta-date">
			<img src="" alt="여행지 사진">          ,l
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