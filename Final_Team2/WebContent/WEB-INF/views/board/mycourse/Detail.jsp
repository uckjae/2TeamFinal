<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- https://codepen.io/uckjae/pen/WNNmMEO (타임라인 참조사이트링크) -->
	<c:import url="/common/HeadTag.jsp" />
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/timeLine.css">
<title>Insert title here</title>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
	
	<!-- Vertical Timeline -->
	<c:set var="board" value="${requestScope.board}"/>
	<c:set var="contents" value="${fn:split(board.content,'a2qw30#')}"/>
	<c:set var="photos" value="${requestScope.photos }"/>
	<div class="content">
  <div id="conference-timeline">
    <div class="timeline-start">Start</div>
    <h3 class="form-control mb-3">${board.title}</h3>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <c:forEach var="content" items="${contents }">
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <p>When I orbited the Earth in a spaceship, 
            I saw for the first time how beautiful our planet is.
             Mankind, let us preserve and increase this beauty, and not destroy it! 
             <span class="article-number">01</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div>
        
        <div class="meta-date">
			<img src="" alt="여행지 사진">          
        </div>
      </div>
      </c:forEach>
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
      
      <!-- Article -->
      <div class="timeline-article">
        <div class="content-left-container">
          <div class="content-left">
            <p>When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. Mankind, let us preserve and increase this beauty, and not destroy it! <span class="article-number">01</span></p>
          </div>
          <span class="timeline-author">John Doe</span>
        </div>
        <div class="meta-date">
         <img alt="여행지 사진" src="">
        </div>
      </div>
      <!-- // Article -->
    </div>
    <div class="timeline-end">End</div>
  </div>
  </div>
  <!-- // Vertical Timeline -->
  <div class="content" style="text-align: center;">
  	<h1>지도자리</h1>
  	<br/>
  	<br/>
  	<br/>
  	<br/>
  	<br/>
  	<br/>
  	<br/>
  </div>
</body>
</html>