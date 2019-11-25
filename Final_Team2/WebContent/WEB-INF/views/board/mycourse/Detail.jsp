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
<%
	
%>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <!-- Top -->
    <c:import url="/common/Top.jsp" />
	
	<!-- Vertical Timeline -->
	<c:set var="board" value="${requestScope.board}"/>
	<c:set var="contents" value="${fn:split(board.content,'a2qw30#')}"/>
	<c:set var="photos" value="${requestScope.photos }"/>
	<c:forEach var="photo" items="${photos}" varStatus="photoStatus">
		!!!${photo.photoName}
	</c:forEach>
	
	<div class="content">
  <div id="conference-timeline">
    <div class="timeline-start">Start</div>
    <h3 class="form-control mb-3">${board.title}</h3>
    <div class="conference-center-line"></div>
    <div class="conference-timeline-content">
      <!-- Article -->
      <c:forEach var="content" items="${contents}" varStatus="status">
      	<c:choose>
      		<c:when test="${status.index%2 != 1}">
      			<div class="timeline-article">
      				<div class="content-left-container">
      					<h1>Left!!!!</h1>
      						<c:forEach var="text" items="${fn:split(content,'f0q234ksd')}" varStatus="status1">
								<c:choose>
									<c:when test="${status1.index == 0}">
										<div class="content-left">
											<p>${text}</p>
											<span class="article-number">${status.index}</span>
										</div>
									</c:when>
									<c:otherwise>
										<span class="timeline-author">${text}</span>
									</c:otherwise>
								</c:choose>
								<div class="meta-date">
									<img class="image2" src="upload/${photos[status.index] }" alt="여행지사진" onError="this.src='images/scenery.png'">
								</div>
      						</c:forEach>
      				</div>
      			</div>
      		</c:when>
      		<c:otherwise>
      			<div class="timeline-article">
      				<div class="content-right-container">
      					<h1>Right!!!</h1>
      					<c:forEach var="text" items="${content}" varStatus="status2">
      						<c:choose>
      							<c:when test="${status2.index == 0}">
      								<div class="content-right">
      									<p>${text}</p>
      									<span class="article-number">${status.index }</span>
      								</div>
      							</c:when>
      							<c:otherwise>
      								<span class="timeline-author">${text}</span>
      							</c:otherwise>
      						</c:choose>
      						<div class="meta-date">
      							<img class="image2" src="upload/${photos[status.index] }" alt="여행지사진" onError="this.src='images/scenery.png'">
      						</div>
      					</c:forEach>
      				</div>
      			</div>
      		</c:otherwise>
      	</c:choose>
       </c:forEach>
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