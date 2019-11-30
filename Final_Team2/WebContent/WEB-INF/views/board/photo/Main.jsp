<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/common/HeadTag.jsp" />
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<c:import url="/common/Top.jsp" />
<c:set var="photolist" value="${requestScope.photolist }"/>
<c:set var="boardlist" value="${requestScope.boardlist }"/>
			      
			<div class="content">
        <div class="comment-form-wrap pt-xl-2">
        	<div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
            	<h1 class="mb-3 bread">포토 게시판</h1>
        	</div>
        	<div class="row">
        		<c:forEach var="photo" items="${photolist}">
        			<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">
        				<div class="project">
        					<div class="img">
        						<img class="img-fluid" src="upload/${photo.photoName}" alt="코스 대표 사진" onError="this.src='images/scenery.png'">
        					</div>
        					<c:forEach var="board" items="${boardlist}">
        						<c:if test="${photo.bIdx eq board.bIdx}">
        							<div class="text">
        								<h4 class="price">
        									<span class="mr-2">조회수</span>
        									${board.rNum}
        								</h4>
        								<h3>
        								<a href="PhotoBoardDetail.do?bIdx=${board.bIdx }">${board.title }</a>
        								</h3>
        								<h5>${board.id }</h5>
        								<h6><fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd   HH:mm:ss" /></h6>
        							</div>
        						</c:if>
        					</c:forEach>
        				</div>
        			</div>
        		</c:forEach>
        	</div>
        	</div>
        	</div>
		    		<c:if test="${sessionScope.memberId !=null}">
				   <div class="text-right" style=" margin-right: 180px; margin-bottom: 10px; ">
				    <a href="PhotoWrite.do?cmd=write">
				    	<input type="button" value="글작성" id="photo" name="photo">	
				    </a>
				    </div>
				    </c:if>			

    
</body>
</html>